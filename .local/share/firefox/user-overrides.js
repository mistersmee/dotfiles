user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("widget.use-xdg-desktop-portal.file-picker", 1);

/** Override Safe browsing binary check, I want this protection **/
user_pref("browser.safebrowsing.downloads.remote.enabled", true);

/** Override Telemetry: I trust Mozilla, at least for now **/
user_pref("datareporting.policy.dataSubmissionEnabled", true);
user_pref("datareporting.healthreport.uploadEnabled", true);
user_pref("toolkit.telemetry.unified", true);
user_pref("toolkit.telemetry.archive.enabled", true);
user_pref("toolkit.telemetry.newProfilePing.enabled", true); // [FF55+]
user_pref("toolkit.telemetry.shutdownPingSender.enabled", true); // [FF55+]
user_pref("toolkit.telemetry.updatePing.enabled", true); // [FF56+]
user_pref("toolkit.telemetry.bhrPing.enabled", true); // [FF57+] Background Hang Reporter
user_pref("toolkit.telemetry.firstShutdownPing.enabled", true); // [FF57+]
user_pref("toolkit.telemetry.coverage.opt-out", false); // [HIDDEN PREF]
user_pref("toolkit.coverage.opt-out", false); // [FF64+] [HIDDEN PREF]
user_pref("toolkit.telemetry.server", "https://incoming.telemetry.mozilla.org");
user_pref("toolkit.coverage.endpoint.base", "https://coverage.mozilla.org");

/** I am aware of the risks mentioned in the EFF article linked **/
user_pref("network.captive-portal-service.enabled", true); // [FF52+]

user_pref("signon.rememberSignons", false);
