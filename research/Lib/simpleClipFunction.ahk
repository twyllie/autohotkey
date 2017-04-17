simpleClipFunction() {
	clipboard = ; Start off empty to allow ClipWait to detect when the text has arrived.
	Send ^c
	ClipWait, 4 ; Wait for the clipboard to contain text.
	MsgBox The clipboard picked up the text: %clipboard%
	return clipboard
}