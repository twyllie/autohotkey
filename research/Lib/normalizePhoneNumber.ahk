normalizePhoneNumber(rawPhoneNumber) {

	phonePattern := "1?[\s-]*\(?(\d\d\d)\)?[\s-]*(\d\d\d)[\s-]*(\d\d\d\d)"
	phoneReplacement := "1-$1-$2-$3"
	phone := RegExReplace(rawPhoneNumber, phonePattern, phoneReplacement)
	
	return phone
}