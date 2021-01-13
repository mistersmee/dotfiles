#!/usr/bin/env python3

"""
Displays a notification whenever the backlight brightness is changed.

After a change, the notification is delayed by a given timout, which
gets reset on each consecutive change. Thus, only one notification is
displayed when multiple brightness changes happen in quick succession.

Required Python packages:
  * inotify_simple (https://pypi.org/project/inotify_simple/)
Required applications:
  * notify-send (https://developer.gnome.org/libnotify/)

Author: Benedikt Vollmerhaus <benedikt@vollmerhaus.org>
License: MIT
"""

import argparse
import logging
import pathlib
import subprocess
import sys
from threading import Timer
from typing import Optional

import inotify_simple

#: Absolute path to the sysfs backlight class
BACKLIGHT_SYSFS_PATH: pathlib.Path = pathlib.Path('/sys/class/backlight')
#: Filename to read the current brightness from
BRIGHTNESS_FILENAME: str = 'actual_brightness'
#: Filename to read the maximum brightness from
MAX_BRIGHTNESS_FILENAME: str = 'max_brightness'


def _parse_args() -> argparse.Namespace:
    """
    Parse and return any provided command line arguments.

    :return: A namespace holding the parsed arguments
    """
    parser = argparse.ArgumentParser(
        description="Displays a notification when the given "
                    "backlight's brightness is changed.")

    parser.add_argument('-b', '--backlight',
                        type=str, metavar='class', default='acpi_video0',
                        help='backlight device whose brightness to '
                             'monitor and display notifications for '
                             '(default: %(default)s)')

    parser.add_argument('-d', '--delay',
                        type=float, metavar='N', default=.5,
                        help='delay in seconds to wait between brightness '
                             'changes before the notification is displayed '
                             '(default: %(default).1f)')

    args: argparse.Namespace = parser.parse_args()

    if args.delay <= 0:
        parser.error('Notification delay must be larger than 0.')

    return args


class BrightnessNotifier:
    """
    Display a notification whenever the backlight brightness is changed.
    """

    def __init__(self) -> None:
        args: argparse.Namespace = _parse_args()
        self.keypress_timeout: int = args.delay

        device: str = args.backlight
        self.brightness_file: pathlib.Path = (
            BACKLIGHT_SYSFS_PATH / device / BRIGHTNESS_FILENAME)
        self.max_brightness_file: pathlib.Path = (
            BACKLIGHT_SYSFS_PATH / device / MAX_BRIGHTNESS_FILENAME)

        self.new_brightness: int = 0
        self.prev_brightness: int = self.get_current_brightness()
        self.max_brightness: int = self.get_max_brightness()

        logging.info('Backlight set to %s. Monitoring brightness...', device)

    def watch_for_changes(self) -> None:
        """
        Monitor the sysfs brightness file and notify on modifications.

        Create an inotify watch for the sysfs brightness file and wait
        for IN_MODIFY events. Once an event is received, start a timer
        after which the notification is sent. It gets (re)started with
        each event, so that consecutive brightness changes only result
        in a single notification.

        :return: None
        """
        i = inotify_simple.INotify()
        i.add_watch(self.brightness_file, mask=inotify_simple.flags.MODIFY)

        timer: Optional[Timer] = None
        while True:
            i.read()  # Block until an event is received

            if timer is not None:
                timer.cancel()

            self.new_brightness = self.get_current_brightness()
            if self.prev_brightness == self.new_brightness:
                continue

            timer = Timer(self.keypress_timeout, self.show_notification)
            timer.start()

    def show_notification(self) -> None:
        """
        Trigger a notification with the current and maximum brightness.

        :return: None
        """
        logging.info('Notifying about brightness change from %d to %d.',
                     self.prev_brightness, self.new_brightness)

        self.prev_brightness = self.new_brightness

        subprocess.run([
            'notify-send', '-i', 'xfpm-brightness-lcd', '-c', 'device',
            'Brightness', f'{self.new_brightness} / {self.max_brightness}'
        ], check=True)

    def get_current_brightness(self) -> int:
        """
        Return the current screen brightness from its sysfs file.

        :return: The current screen brightness
        """
        return int(self.brightness_file.read_text().strip())

    def get_max_brightness(self) -> int:
        """
        Return the maximum screen brightness from its sysfs file.

        :return: The maximum screen brightness
        """
        return int(self.max_brightness_file.read_text().strip())


if __name__ == '__main__':
    logging.basicConfig(format='%(message)s', level=logging.INFO)

    try:
        BrightnessNotifier().watch_for_changes()
    except KeyboardInterrupt:
        sys.exit()
