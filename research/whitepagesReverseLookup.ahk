whitepagesReverseLookup() {
	copiedText := Clipboard
	standardPhone := normalizePhoneNumber(copiedText)
	
	;Load the site
	whitepages := IEGet("WhitePages")
	
	if (!whitepages) {
		whitepages := ComObjCreate("InternetExplorer.Application")
		whitepages.Visible:=True
	}
	else {
		WinActivate % whitepages.LocationName
		whitepages.Visible:=True
	}
	
	whitepages.Navigate(URL_WHITEPAGES_REVERSE_PHONE_LOOKUP . standardPhone)
	Return
}