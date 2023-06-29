-- requires subdl: https://github.com/akexakex/subdl
-- default keybinding: b
-- add the following to your input.conf to change the default keybinding:
-- keyname script_binding subdl_load_subs
local utils = require 'mp.utils'
local subdl = "/usr/bin/subdl" -- use 'which subdl' to find the real path

function subdl_load()
    mp.msg.info("Searching subtitles...")
    mp.osd_message("Searching subtitles...")
    t = {}
    t.args = {subdl, "--lang=eng", "--download=first", mp.get_property("path")}
    res = utils.subprocess(t)
    if res.status == 0 then
        mp.commandv("rescan_external_files", "reselect")
        mp.msg.info("Subtitle download succeeded")
        mp.osd_message("Subtitle download succeeded")
    else
        mp.msg.warn("Subtitle download failed")
        mp.osd_message("Subtitle download failed")
    end
end

mp.add_key_binding("b", "subdl_load_subs", subdl_load)
