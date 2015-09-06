on findTab(search_list)
  tell application "Google Chrome"
    set tab_idx to 0
    repeat with _tab in (every tab in front window)
      set tab_idx to tab_idx + 1
      set tab_url to (URL of _tab as string)
      set tab_title to (title of _tab as string)
      repeat with search_item in search_list
        if my urlMatch(tab_url, search_item) and my titleMatch(tab_title, search_item) then
          return {status:true, tab_idx:tab_idx}
        end if
      end repeat
    end repeat

    return {status:false}
  end tell
end findTab

on urlMatch(tab_url, search_item)
  return (_url of search_item) is in tab_url
end urlMatch

on titleMatch(tab_title, search_item)
  return contents of tab_title is "" or (_title of search_item) is in tab_title
end titleMatch
