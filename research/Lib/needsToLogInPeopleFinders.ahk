needsToLogInPeopleFinders(page) {
	loginLink := page.document.querySelectorAll("a[href='/login?ReturnUrl=%2F']")[0]
		If (loginLink) {
			return true
		}
		else {
			return false
		}
}
