switchboardReversePhoneLookup() {
	copiedText := Clipboard
	standardPhone := normalizePhoneNumber(copiedText)
	
	;Load the site
	switchboard := IEGet("Switchboard")
	
	if (!switchboard) {
		switchboard := ComObjCreate("InternetExplorer.Application")
		switchboard.Visible:=True
	}
	else {
		WinActivate % switchboard.LocationName
		switchboard.Visible:=True
	}
	
	switchboard.Navigate(URL_SWITCHBOARD_REVERSE_PHONE_LOOKUP . standardPhone)
	Return
}