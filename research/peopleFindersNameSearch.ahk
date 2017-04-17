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
			peopleFinders.document.getElementById(ID_LINK_LOGIN).click()
			IELoad(peopleFinders)
			peopleFinders.document.getElementById(ID_INPUT_EMAIL).value := LOGIN_EMAIL 
			peopleFinders.document.getElementById(ID_INPUT_PASSWORD).value := LOGIN_PASSWORD
			peopleFinders.document.getElementById(ID_BUTTON_SIGN_IN).Click()
			IELoad(peopleFinders)
		}
		
		if (needsToSelectPeopleSearch(peopleFinders)) {
			peopleSearchLink := getPeopleSearchLink(peopleFinders)
			peopleSearchLink.Click()
			IELoad(peopleFinders)
		}
		
		if (oldPeopleFindersDesignIsUp(peopleFinders)) {
			peopleFinders.document.getElementById(PF_OLD_INPUT_FIRST_NAME).value := nameArray["firstName"] 
			peopleFinders.document.getElementById(PF_OLD_INPUT_LAST_NAME).value := nameArray["lastName"]
			peopleFinders.document.getElementById(PF_OLD_INPUT_CITY).value := cityValue
			peopleFinders.document.getElementById(PF_OLD_INPUT_STATE).value := stateValue
			peopleFinders.document.getElementById(PF_OLD_BUTTON_PEOPLE_SEARCH).click()
			if (nameArray["middleName"]) {
				IELoad(peopleFinders)
				peopleFinders.document.getElementById(PF_OLD_INPUT_MI).value := nameArray["middleName"]
				peopleFinders.document.getElementById(PF_OLD_BUTTON_UPDATE_SEARCH).click()
			}
		}
		else {
			peopleFinders.document.getElementById(PF_NEW_INPUT_FIRST_NAME).value := nameArray["firstName"]
			peopleFinders.document.getElementById(PF_NEW_INPUT_MIDDLE_INITIAL).value := nameArray["middleName"]
			peopleFinders.document.getElementById(PF_NEW_INPUT_LAST_NAME).value := nameArray["lastName"]
			peopleFinders.document.getElementById(PF_NEW_INPUT_CITY).value := cityValue
			peopleFinders.document.getElementById(PF_NEW_INPUT_STATE).value := stateValue
			peopleFinders.document.querySelectorAll("[type=people]")[0].getElementsByTagName("button")[0].Click()
		}
	}
	Return
}

oldPeopleFindersDesignIsUp(page) {
	return page.document.getElementById(PF_OLD_INPUT_FIRST_NAME)
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