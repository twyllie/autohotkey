buildAddressArray(rawAddressString) {
	StringSplit, addressArray, rawAddressString, `n, `r ;`n`r is delimiter
	
	if (addressArray0 < 2 || (!addressArray1 && addressArray0 < 3)) {
		MsgBox An address from people finders must contain at least 2 lines of text.
		Return null
	}
	else if (!addressArray1) {	;this allows user to select back to the end of the last line before address.  
								; (makes text selection in browser easier)
		addressArray1 := addressArray2
		addressArray2 := addressArray3
	}
	streetAddress := addressArray1
	
	cityPattern := "^[^,]+"
	matchPos := RegExMatch(addressArray2, cityPattern, city)
	
	stateAndZipPattern := ", ([A-Z]{2}) ([0-9]{5})(-[0-9]{4})?$"
	matchPos := RegExMatch(addressArray2, stateAndZipPattern, stateAndZip)
	zip := stateAndZip2		; copying this String because the following logic operator automatically converts stateAndZip2 to a number
	if (!stateAndZip1 || !stateAndZip2) {
		MsgBox There was either a missing state or zip code.
		return null
	}
	
	resultArray := {"streetAddress": streetAddress, "city": city, "state": stateAndZip1, "zip": zip}
	return resultArray
}