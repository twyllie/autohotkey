switchboardFindAPerson() {
	#WinActivateForce
	
	IfWinExist, Excel
	{
		excelApp := Excel_Get()
		
		activeCellRow := excelApp.ActiveCell.Row
		
		associateValue := excelApp.Range(EXCEL_COLUMN_ASSOCIATE . activeCellRow).Value
		cityValue := excelApp.Range(EXCEL_COLUMN_CITY . activeCellRow).Value
		stateValue := excelApp.Range(EXCEL_COLUMN_STATE . activeCellRow).Value
		
		nameArray := buildNameArray(associateValue)
		
		;Load the site
		switchboardName := IEGet("Switchboard")
	
		if (!switchboardName) {
			switchboardName := ComObjCreate("InternetExplorer.Application")
			switchboardName.Visible:=True
		}
		else {
			WinActivate % switchboardName.LocationName
			switchboardName.Visible:=True
		}
	
		switchboardName.Navigate(URL_SWITCHBOARD_FIND_PEOPLE . nameArray["firstName"] . "-" . nameArray["lastName"] . "/" . cityValue . "-" . stateValue)
	}

}