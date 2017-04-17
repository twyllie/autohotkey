buildNameArray(rawNameString) {
	StringSplit, nameArray, rawNameString, %A_Space%, . ;A_Space is delimiter, dot is the character to exclude
	hasSuffix := findNameSuffix(nameArray%nameArray0%)
	lastNameIndex := nameArray0
	if (hasSuffix) {
		lastNameIndex--
	}	
	lastName := nameArray%lastNameIndex%
	firstName := nameArray1
	
	middleName := null
	if (lastNameIndex == 3) {
		middleName := nameArray2
	}
	
	resultArray := {"firstName": firstName, "middleName": middleName, "lastName": lastName}
	return resultArray
		
}

findNameSuffix(word) {
	surnameRegEx := "^(Jr|Sr|[IVX]+)$"
	surnamePos := RegExMatch(word, surnameRegEx)
	return %surnamePos%
}