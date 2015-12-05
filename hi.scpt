on run argv
  if count of argv > 0
    set _key to (item 1 of argv)
    my openUrl(_key)
  end
end run

on openUrl(_key)
