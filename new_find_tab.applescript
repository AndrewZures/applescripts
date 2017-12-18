local my_url
global trigger_data

-- custom site data goes here --
set my_url to "https:///github.com"
set trigger_data to {{_url:"github.com", _title:""}}

tell application "Google Chrome"
	if it is not running then
		open location my_url
	else
		set result to my find_tab()
		if (get status of result) then
			set active tab index of (get _window of result) to (get tab_idx of result)
		else
			open location my_url
		end if
	end if
	activate
end tell

on find_tab()
	tell application "Google Chrome"
		repeat with _window in every window
			set tab_idx to 0
			repeat with _tab in every tab in _window
				set tab_idx to tab_idx + 1
				repeat with trigger in trigger_data
					set search_term to (get _url of trigger)
					set title_term to (get _title of trigger)
					if search_term is in (URL of _tab as string) then
						if contents of title_term is "" or title_term is in (title of _tab as string) then
							return {status:true, _window:_window, tab_idx:tab_idx}
						end if
					end if
				end repeat
			end repeat
		end repeat
		return {status:false}
	end tell
end find_tab
