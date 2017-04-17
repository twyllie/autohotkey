copyLookupInfoToExcel() {
	copiedText := Clipboard
	
	IfWinExist, Excel 
	{
		WinActivate
		excelApp := Excel_Get()
		excelApp.Visible:=True
		activeCellRow := excelApp.ActiveCell.Row
		if (!activeCellRow) {
			MsgBox You must select a row in the Excel contacts file for this function to work.
		}
		
		nextAvailableColumn := findNextBlankColumnInRow(excelApp, activeCellRow)
		excelApp.Range(nextAvailableColumn . activeCellRow).Value := copiedText
	}
	else {
		MsgBox You must open the Excel contacts file for this function to work.
	}
	
	Return
}

findNextBlankColumnInRow(excelHandle, rowToCheck) {
	ASCII := 74		;the ASCII value of "J", which is the first column we want to check
	
	while (ASCII < 91) {
		Transform, nextColumn, Chr, %ASCII%
		nextCellValue := excelHandle.Range(nextColumn . rowToCheck).Value
	
		if (!nextCellValue) {
			return nextColumn
		}
		ASCII++
	}
	
	return nextColumn
}