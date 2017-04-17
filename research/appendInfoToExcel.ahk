appendInfoToExcel() {
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
		
		lastUsedColumn := findLastUsedColumnInRow(excelApp, activeCellRow)
		existingCellText := excelApp.Range(lastUsedColumn . activeCellRow).Value
		excelApp.Range(lastUsedColumn . activeCellRow).Value := existingCellText . "`n" . copiedText
	}
	else {
		MsgBox You must open the Excel contacts file for this function to work.
	}
	
	Return
}

findLastUsedColumnInRow(excelHandle, rowToCheck) {
	ASCII := 74		;the ASCII value of "J", which is the first column we want to check
	
	while (ASCII < 90) {
		Transform, nextColumn, Chr, %ASCII%
		nextCellValue := excelHandle.Range(nextColumn . rowToCheck).Value
	
		if (!nextCellValue) {
			ASCII--
			Transform, nextColumn, Chr, %ASCII%
			return nextColumn
		}
		ASCII++
	}
	
	return lastUsedColumn
}

