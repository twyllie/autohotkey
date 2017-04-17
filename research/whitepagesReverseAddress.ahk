whitepagesReverseAddress() {
	copiedText := Clipboard
	
	addressArray := buildAddressArray(copiedText)
	if (!addressArray) {
		MsgBox Incomplete address.  Exiting script.
		Return
	}
	
	;Load the site
	whitepagesReverseAddress := IEGet("WhitePages")
	
	if (!whitepagesReverseAddress) {
		whitepagesReverseAddress := ComObjCreate("InternetExplorer.Application")
		whitepagesReverseAddress.Visible:=True
	}
	else {
		WinActivate % whitepagesReverseAddress.LocationName
		whitepagesReverseAddress.Visible:=True
	}
	
	whitepagesReverseAddress.Navigate(URL_WHITEPAGES_REVERSE_ADDRESS) 
	IELoad(whitepagesReverseAddress)
	whitepagesReverseAddress.document.getElementById("street").value := addressArray["streetAddress"]
	whitepagesReverseAddress.document.getElementById("where").value := addressArray["zip"]
	whitepagesReverseAddress.document.getElementsByTagName("form")[0].submit()
}