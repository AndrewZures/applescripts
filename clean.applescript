on run argv
set whiteList to {{_url:"mail.google.com/mail", found:false}, {_url:"www.google.com/calendar", found:false}, {_url:"hireology.atlassian.net/secure/RapidBoard.jspa", found:false}}

tell application "Google Chrome"
  set windowList to every window
  repeat with _window in windowList
    set _tabs to every tab in _window
    repeat with _tab in (reverse of _tabs)
      set _delete to true
      repeat with listItem in whiteList
        if not (found in listItem) and (_url in listItem) is in (URL in _tab) then
          set _delete to false
          set (found in listItem) to true
        end if
      end repeat

      if _delete then
        close _tab
      end if
    end repeat
  end repeat

end tell
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
