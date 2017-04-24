peopleFindersNameSearch() {
	IfWinExist, Excel
	{
		excelApp := Excel_Get()

		activeCellRow := excelApp.ActiveCell.Row

		associateValue := excelApp.Range(EXCEL_COLUMN_ASSOCIATE . activeCellRow).Value
		cityValue := excelApp.Range(EXCEL_COLUMN_CITY . activeCellRow).Value
		stateValue := excelApp.Range(EXCEL_COLUMN_STATE . activeCellRow).Value

		nameArray := buildNameArray(associateValue)

		;Load the site
		peopleFinders := IEGet("PeopleFinders")
		;TabActivate2("PeopleFinders")

		if (!peopleFinders) {
			peopleFinders := ComObjCreate("InternetExplorer.Application")
			peopleFinders.Visible:=True
			peopleFinders.Navigate(URL_PEOPLE_FINDERS)
			IELoad(peopleFinders)
		}
		else {
			WinActivate % peopleFinders.LocationName
			peopleFinders.Visible:=True
		}


		If (needsToLogInPeopleFinders(peopleFinders)) {
			peopleFinders.document.querySelectorAll("a[href='/login?ReturnUrl=%2F']")[0].Click()
			IELoad(peopleFinders)
			peopleFinders.document.getElementById("signin_UserName").value := LOGIN_EMAIL
			peopleFinders.document.getElementById("signin_Password").value := LOGIN_PASSWORD
			peopleFinders.document.querySelectorAll("input[type='submit']")[0].Click()
			IELoad(peopleFinders)
		}

		; if (needsToSelectPeopleSearch(peopleFinders)) {
		; 	peopleSearchLink := getPeopleSearchLink(peopleFinders)
		; 	peopleSearchLink.Click()
		; 	IELoad(peopleFinders)
		; }

		peopleFinders.document.getElementById(PF_NEW_INPUT_FIRST_NAME).value := nameArray["firstName"]
		peopleFinders.document.getElementById(PF_NEW_INPUT_MIDDLE_INITIAL).value := nameArray["middleName"]
		peopleFinders.document.getElementById(PF_NEW_INPUT_LAST_NAME).value := nameArray["lastName"]
		peopleFinders.document.getElementById(PF_NEW_INPUT_CITY).value := cityValue
		peopleFinders.document.getElementById(PF_NEW_INPUT_STATE).value := stateValue
		peopleFinders.document.querySelectorAll("button.btn.btn-lg-default-orange.btn-search")[0].Click()

	}
	Return
}

getPeopleSearchLink(page) {
	links := page.document.getElementsByTagName("a")
	Loop % links.length {
		linkElement := links[A_Index - 1]
		linkHtml := linkElement.innerHTML
		searchResult := RegExMatch(linkHtml, "People Search")
		if (searchResult > 0) {
			return linkElement
		}
	}
}

needsToSelectPeopleSearch(page) {
	notOnPeopleSearch := true
	headers := page.document.getElementsByTagName("h1")
	Loop % headers.length
	if (headers[A_Index - 1].innerText = "People Search") {
		notOnPeopleSearch := False
		Break
	}
	return notOnPeopleSearch
}
