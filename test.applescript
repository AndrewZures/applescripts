on run argv
  log(item 1 of argv)
  set list as (item 1 of argv as list)
  repeat with item in list
    log(item as string)
  end repeat
end run
