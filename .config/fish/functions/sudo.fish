function sudo --wraps doas
    doas $argv
end
