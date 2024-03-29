#!/usr/bin/env python3

"""
Displays a notification whenever a battery's charge is getting low.

Multiple active batteries are supported and monitored individually.
This is done via regular polling at a specific interval, as inotify
doesn't appear to support monitoring the "power_supply" sysfs class.

Required applications:
  * notify-send (https://developer.gnome.org/libnotify/)

Author: Benedikt Vollmerhaus <benedikt@vollmerhaus.org>
License: MIT
"""

import argparse
import logging
import pathlib
import re
import subprocess
import sys
import threading
import time
from collections import namedtuple
from typing import Dict, NoReturn

Notification = namedtuple('Notification', ['status', 'msg', 'icon', 'urgency'])

#: Absolute path to the sysfs power_supply class
PS_SYSFS_PATH: pathlib.Path = pathlib.Path('/sys/class/power_supply')


def _get_current_charge(battery: pathlib.Path) -> int:
    """
    Return the given battery's current charge in percent.

    :param battery: The device path of the battery to query
    :return: The battery's current charge in percent
    """
    capacity_file = next(file for file in battery.iterdir()
                         if file.name == 'capacity')
    return int(capacity_file.read_text())


def _is_discharging(battery: pathlib.Path) -> bool:
    """
    Check whether the given battery is currently discharging.

    :param battery: The device path of the battery to query
    :return: Whether the battery is currently discharging
    """
    status_file = next(file for file in battery.iterdir()
                       if file.name == 'status')
    return status_file.read_text().strip() == 'Discharging'


def _parse_args() -> argparse.Namespace:
    """
    Parse and return any provided command line arguments.

    :return: A namespace holding the parsed arguments
    """
    parser = argparse.ArgumentParser(
        description="Displays a notification whenever a "
                    "battery's charge is getting low.")

    parser.add_argument('-i', '--interval',
                        type=int, metavar='N', default=30,
                        help='interval for polling the current battery '
                             'charge (default: %(default)d, in seconds)')

    parser.add_argument('-l', '--low',
                        type=int, metavar='N', default=20,
                        help='charge at which to show a "battery low" '
                             'warning (default: %(default)d)')

    parser.add_argument('-c', '--critical',
                        type=int, metavar='N', default=5,
                        help='charge at which to show a "battery critical" '
                             'warning (default: %(default)d)')

    args: argparse.Namespace = parser.parse_args()

    if not (0 < args.low < 100 and 0 < args.critical < 100):
        parser.error('Warning thresholds must be between 0 and 100.')

    if args.low <= args.critical:
        parser.error('Low must be higher than critical threshold.')

    return args


class BatteryNotifier:
    """Monitor battery charges and notify at the set thresholds."""

    def __init__(self) -> None:
        args: argparse.Namespace = _parse_args()

        self.polling_interval: int = args.interval

        self.thresholds: Dict[int, Notification] = {
            args.low: Notification(
                status='at 20%, running low',
                msg='Maybe go look for a charger.',
                icon='battery-caution', urgency='normal'),
            args.critical: Notification(
                status='at 5%, critically low',
                msg='Please save any unsaved work.',
                icon='battery-empty', urgency='critical')
        }

    def monitor_batteries(self) -> None:
        """
        Begin monitoring any batteries installed in the system.

        :return: None
        """
        batteries = [b for b in PS_SYSFS_PATH.iterdir()
                     if (b / 'capacity').exists()]

        if not batteries:
            logging.error('No batteries found in %s.', PS_SYSFS_PATH)
            return

        logging.info('Monitoring batteries:')

        for battery_path in batteries:
            logging.info(' * %s', battery_path)

            current_charge: int = _get_current_charge(battery_path)
            initial_threshold: int = self.get_initial_threshold(current_charge)

            polling_thread = threading.Thread(target=self.poll_battery(
                battery_path, initial_threshold), daemon=True)
            polling_thread.start()

    def poll_battery(self, battery: pathlib.Path,
                     current_threshold: int) -> NoReturn:
        """
        Retrieve the given battery's charge and notify if necessary.

        The current threshold is set to the next lower one each time
        it is reached. Since a notification is only triggered if the
        charge is <= the current threshold, this leads to none being
        shown until reaching the next threshold.

        :param battery: The device path of the battery to query
        :param current_threshold: The threshold to warn at
        :return: None
        """
        while True:
            current_charge: int = _get_current_charge(battery)

            if not _is_discharging(battery):
                current_threshold = self.get_initial_threshold(current_charge)

            if current_charge <= current_threshold and _is_discharging(battery):
                self.show_notification(battery.name, current_threshold)
                current_threshold = self.get_next_threshold(current_charge)

            time.sleep(self.polling_interval)

    def show_notification(self, bat_name: str, threshold: int) -> None:
        """
        Trigger a notification warning about a battery's low charge.

        :param bat_name: The device name of the low-running battery
        :param threshold: The threshold whose notification to show
        :return: None
        """
        notification: Notification = self.thresholds.get(threshold)
        bat_nr: str = re.search(r'\d+$', bat_name).group()

        subprocess.run([
            'notify-send', '-i', notification.icon,
            '-u', notification.urgency, '-c', 'device',
            f'Battery {bat_nr} is {notification.status}',
            notification.msg
        ], check=True)

    def get_initial_threshold(self, charge: int) -> int:
        """
        Find the appropriate initial threshold for a given charge.

        This is either the next higher threshold if there is one,
        or the overall highest one otherwise.

        :param charge: A battery charge in percent
        :return: The next higher threshold or the highest if none
        """
        return min((t for t in self.thresholds if t >= charge),
                   default=max(self.thresholds))

    def get_next_threshold(self, charge: int) -> int:
        """
        Find the next lower threshold from a given charge.

        :param charge: A battery charge in percent
        :return: The next lower threshold or -1 if none
        """
        return max((t for t in self.thresholds if t < charge), default=-1)


if __name__ == '__main__':
    logging.basicConfig(format='%(message)s', level=logging.INFO)

    try:
        BatteryNotifier().monitor_batteries()
    except KeyboardInterrupt:
        sys.exit()
