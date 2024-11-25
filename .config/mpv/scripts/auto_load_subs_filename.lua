--[[

  Automatically download subtitles from opensubtitles.com

  Requires the Python package opensubtitlescom to be
  installed (pip install opensubtitlescom) and configured
  with your credentials (ost set-cred). See
  https://github.com/dusking/opensubtitles-com for more
  information.

  Adapted from https://github.com/vayan/autosub-mpv

  Quick & dirty search-by-filename version for Linux

]]

local utils = require 'mp.utils'

function display_error()
  mp.msg.warn("Subtitle download failed: ")
  mp.osd_message("Subtitle download failed")
end

function load_sub_fn()
  local path = mp.get_property("path")
  local dir, filename = utils.split_path(path)
  mp.osd_message("Searching subtitle...")
  local id = io.popen("ost search --query '"..filename.."' | awk -F '|' 'NR==4 {print $5}'"):read("*number")
  if id then
    local srt_path = string.gsub(path, "%.%w+$", ".srt")
    if os.execute("cd '"..dir.."' && ost download --file-id "..id.." && mv "..id..".srt '"..srt_path.."'") then
      if mp.commandv("sub_add", srt_path) then
        mp.msg.warn("Subtitle download succeeded")
        mp.osd_message("Subtitle download succeeded: \n" .. srt_path .. "", 5)
      else
        display_error()
      end
    else
      display_error()
    end
  else
    display_error()
  end
end

mp.add_key_binding("a", "auto_load_subs_filename", load_sub_fn)
