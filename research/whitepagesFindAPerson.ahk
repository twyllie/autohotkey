whitepagesFindAPerson() {
	IfWinExist, Excel
	{
		excelApp := Excel_Get()
		
		activeCellRow := excelApp.ActiveCell.Row
		
		associateValue := excelApp.Range(EXCEL_COLUMN_ASSOCIATE . activeCellRow).Value
		cityValue := excelApp.Range(EXCEL_COLUMN_CITY . activeCellRow).Value
		stateValue := excelApp.Range(EXCEL_COLUMN_STATE . activeCellRow).Value
		
		nameArray := buildNameArray(associateValue)
		
		;Load the site
		whitePagesName := IEGet("WhitePages")
	
		if (!whitePagesName) {
			whitePagesName := ComObjCreate("InternetExplorer.Application")
			whitePagesName.Visible:=True
		}
		else {
			WinActivate % whitePagesName.LocationName
			whitePagesName.Visible:=True
		}
	
		whitePagesName.Navigate(URL_WHITEPAGES_FIND_PEOPLE . nameArray["firstName"] . "-" . nameArray["lastName"] . "/" . cityValue . "-" . stateValue)
	}

}