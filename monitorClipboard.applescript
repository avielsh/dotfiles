set prevClipboard to ""
repeat while true
	delay 2
	try
		set clip to the clipboard as text
	on error
		if prevClipboard is not equal to 1 then
			display notification "Clipboard changed with inaccessible data" with title "Clipboard content changed" sound name "Pop"
		end if
		set prevClipboard to 1
		set clip to prevClipboard
	end try
	
	if (prevClipboard is not equal to clip) then
		set prevClipboard to clip
		display notification clip with title "Clipboard content changed" sound name "Pop"
	end if
end repeat

