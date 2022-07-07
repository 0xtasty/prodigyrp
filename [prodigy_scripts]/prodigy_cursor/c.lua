function cursorButton()
	showCursor(not isCursorShowing())
end
bindKey("m", "down", cursorButton)

