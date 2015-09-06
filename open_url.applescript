local _url, my_search
global trigger_data
set _url to "https://github.com/Hireology/app"
set trigger_data to {{_url:"github.com", _title:"Hireology"}}
set finder to (load script("find_tab.scpt"))

on openUrl(_url, search_items)
tell application "Google Chrome"
  if it is not running then
    open location _url
  else
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
