switchboardReverseAddress() {
	copiedText := Clipboard
	
	addressArray := buildAddressArray(copiedText)
	if (!addressArray) {
		MsgBox Incomplete address.  Exiting script.
		Return
	}
	
	;Load the site
	switchboardReverseAddress := IEGet("Switchboard")
	
	if (!switchboardReverseAddress) {
		switchboardReverseAddress := ComObjCreate("InternetExplorer.Application")
		switchboardReverseAddress.Visible:=True
	}
	else {
		WinActivate % switchboardReverseAddress.LocationName
		switchboardReverseAddress.Visible:=True
	}
	
	switchboardReverseAddress.Navigate(URL_SWITCHBOARD_REVERSE_ADDRESS) 
	IELoad(switchboardReverseAddress)
	switchboardReverseAddress.document.getElementById("street").value := addressArray["streetAddress"]
	switchboardReverseAddress.document.getElementById("where").value := addressArray["zip"]
	switchboardReverseAddress.document.getElementsByTagName("form")[0].submit()
}