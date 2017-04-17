peopleFindersAddress() {
	copiedText := Clipboard
	
	addressArray := buildAddressArray(copiedText)
	if (!addressArray) {
		MsgBox Incomplete address.  Exiting script.
		Return
	}
	
	
	;Load the site
	peopleFinders := IEGet("PeopleFinders")
	WinActivate % peopleFinders.LocationName
	;TabActivate2("PeopleFinders")
	
	if (!peopleFinders) {
		peopleFinders := ComObjCreate("InternetExplorer.Application")
		peopleFinders.Visible:=True
		peopleFinders.Navigate(URL_PEOPLE_FINDERS)
		IELoad(peopleFinders)
	}
	else {
		peopleFinders.Visible:=True
	}
	
	
	If (needsToLogInPeopleFinders(peopleFinders)) {
		peopleFinders.document.getElementById(ID_LINK_LOGIN).click()
		IELoad(peopleFinders)
		peopleFinders.document.getElementById(ID_INPUT_EMAIL).value := LOGIN_EMAIL 
		peopleFinders.document.getElementById(ID_INPUT_PASSWORD).value := LOGIN_PASSWORD
		peopleFinders.document.getElementById(ID_BUTTON_SIGN_IN).Click()
		IELoad(peopleFinders)
	}
	
	peopleFinders.Navigate(URL_PEOPLE_FINDERS_ADDRESS) 
	IELoad(peopleFinders)
	
	; fill out form
	peopleFinders.document.getElementById(PF_ADDR_SEARCH_ADDR).value := addressArray["streetAddress"] 
	peopleFinders.document.getElementById(PF_ADDR_SEARCH_CITY).value := addressArray["city"]
	peopleFinders.document.getElementById(PF_ADDR_SEARCH_STATE).value := addressArray["state"]
	peopleFinders.document.getElementById(PF_ADDR_SEARCH_ZIP).value := addressArray["zip"]
	peopleFinders.document.getElementById(PF_ADDR_SEARCH_BUTTON).click()
	
}