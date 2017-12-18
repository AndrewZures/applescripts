tell application "Google Chrome"
  if it is running then
    if (count of every window) > 0 then
      set _tabs to every tab in front window
      set active_tab to active tab of front window
      repeat with _tab in _tabs
        if (id of active_tab) is equal to (id of _tab) then
          return
        end if

        close _tab
      end repeat
    end if
  end if
end tell
