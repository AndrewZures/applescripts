local my_url, my_search
global trigger_data
set my_url to "https://github.com/Hireology/app"
set trigger_data to {{_url:"github.com", _title:"Hireology"}}
set finder to (load script("find_tab.scpt"))

tell application "Google Chrome"
  if it is not running then
    open location my_url
  else
    set tabFound to finder's findTab(trigger_data)
    if (status of result) then
      set active tab index of front window to (tab_idx of result)
    else
      open location my_url
    end if

  end if
  activate
end tell
