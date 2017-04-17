needsToLogInPeopleFinders(page) {
	loginLink := page.document.getElementById(ID_LINK_LOGIN)
		If (loginLink) {
			return true
		}
		else {
			return false
		}
}