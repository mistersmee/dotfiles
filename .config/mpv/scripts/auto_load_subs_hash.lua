--[[

  Automatically download subtitles from opensubtitles.com

  Requires the Python package opensubtitlescom to be
  installed (pip install opensubtitlescom) and configured
  with your credentials (ost set-cred). See
  https://github.com/dusking/opensubtitles-com for more
  information.

  Adapted from https://github.com/vayan/autosub-mpv

  Set your preferred key binding on the last line.

]]

local utils = require 'mp.utils'

function display_error()
  mp.msg.warn("Subtitle download failed: ")
  mp.osd_message("Subtitle download failed")
end

function load_sub_fn()
  path = mp.get_property("path")
  srt_path = string.gsub(path, "%.%w+$", ".srt")
  t = { args = { "ost", "download", "--file", path } }

  mp.osd_message("Searching subtitle...")
  res = utils.subprocess(t)
  if res.error == nil then
    if mp.commandv("sub_add", srt_path) then
      mp.msg.warn("Subtitle download succeeded")
      mp.osd_message("Subtitle download succeeded: \n" .. srt_path .. "", 5)
    else
      display_error()
    end
  else
    display_error()
  end
end

mp.add_key_binding("b", "auto_load_subs_hash", load_sub_fn)
