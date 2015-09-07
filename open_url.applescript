on run argv
  if count of argv > 0
    set _key to (item 1 of argv)
    my openUrl(_key)
  end
end run

on openUrl(_key)
  set currentDir to my findDir()
  set tabFinder to (load script (currentDir & "find_tab.scpt"))
  set configurer to (load script (currentDir & "config.scpt"))
  set config to my findConfig(_key, configurer)

  if (id in config) is not equal to "badID" then
    my _openUrl(config, tabFinder)
  end if
end openUrl

on _openUrl(config, tabFinder)
  tell application "Google Chrome"
    if it is not running then
      open location (_url in config)
    else
      set tabFound to tabFinder's findTab((searchList in config))

      if (status of tabFound) then
        set active tab index of front window to (tab_idx of tabFound)
      else
        open location (_url in config)
      end if
    end if

    activate
  end tell
end _openUrl

on findDir()
  tell application "Finder"
    return POSIX path of ((container of (path to me)) as text)
  end tell
end findDir

on findConfig(_key, configurer)
  repeat with confOption in (configurer's standardConfig())
    if (id in confOption) is equal _key
      return confOption
    end if
  end repeat

  return my badConfig()
end findConfig

on badConfig()
  return { id: "badID", _url: "bad", searchList: {}}
end badConfig
