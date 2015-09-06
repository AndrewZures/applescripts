currentDir
set _url to "https://github.com/Hireology/app"
set trigger_data to {{_url:"github.com", _title:"Hireology"}}

on openUrl(_url, search_items)
tell application "Finder"
    set currentDir to POSIX path of ((container of (path to me)) as text)
end tell

tell application "Google Chrome"
  if it is not running then
    open location _url
  else
    set finder to (load script (currentDir & "find_tab.scpt"))
    set tabFound to finder's findTab(search_items)
    if (status of tabFound) then
      set active tab index of front window to (tab_idx of tabFound)
    else
      open location _url
    end if

  end if
  activate
end tell
end openUrl

openUrl(_url, trigger_data)
