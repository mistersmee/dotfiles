user_pref("keyword.enabled", true);
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("privacy.webrtc.legacyGlobalIndicator", false);
/* override recipe: RFP is not for me ***/
user_pref("privacy.resistFingerprinting", false); // 4501
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504 [pointless if not using RFP]
user_pref("webgl.disabled", false); // 4520 [mostly pointless if not using RFP]
