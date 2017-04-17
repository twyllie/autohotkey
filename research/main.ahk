#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode RegEx

#Include %A_ScriptDir%\peopleFindersNameSearch.ahk
#Include %A_ScriptDir%\peopleFindersAddress.ahk
#Include %A_ScriptDir%\switchboardReversePhoneLookup.ahk
#Include %A_ScriptDir%\switchboardFindAPerson.ahk
#Include %A_ScriptDir%\switchboardReverseAddress.ahk
#Include %A_ScriptDir%\copyLookupInfoToExcel.ahk
#Include %A_ScriptDir%\whitepagesReverseLookup.ahk
#Include %A_ScriptDir%\whitepagesFindAPerson.ahk
#Include %A_ScriptDir%\whitepagesReverseAddress.ahk
#Include %A_ScriptDir%\appendInfoToExcel.ahk


;Contacts Spreadsheet
global EXCEL_COLUMN_BUSINESS := "A"
global EXCEL_COLUMN_ADDRESS := "B"
global EXCEL_COLUMN_CITY := "C"
global EXCEL_COLUMN_ZIP := "D"
global EXCEL_COLUMN_STATE := "E"
global EXCEL_COLUMN_ASSOCIATE := "F"

;search site URLs
global URL_PEOPLE_FINDERS := "http://www.peoplefinders.com"
global URL_PEOPLE_FINDERS_ADDRESS := "http://www.peoplefinders.com/property-records"
global URL_SWITCHBOARD_REVERSE_PHONE_LOOKUP := "http://www.switchboard.com/phone/"
global URL_SWITCHBOARD_FIND_PEOPLE := "http://www.switchboard.com/name/"
global URL_SWITCHBOARD_REVERSE_ADDRESS := "http://www.switchboard.com/reverse_address"


global URL_WHITEPAGES_REVERSE_PHONE_LOOKUP := "http://www.whitepages.com/phone/"
global URL_WHITEPAGES_FIND_PEOPLE := "http://www.whitepages.com/name/"
global URL_WHITEPAGES_REVERSE_ADDRESS := "http://www.whitepages.com/reverse_address"


;www.peoplefinders.com Log In
global LOGIN_EMAIL := "soulsalvage@msn.com"
global LOGIN_PASSWORD := "pardee4629"

global ID_LINK_LOGIN := "ctl00_ctl00_MainLoginView_AnonLoginStatus"
global ID_INPUT_EMAIL := "ctl00_MasterContentPlaceHolder_UserNameTextBox"
global ID_INPUT_PASSWORD := "ctl00_MasterContentPlaceHolder_PasswordTextBox"
global ID_BUTTON_SIGN_IN := "ctl00_MasterContentPlaceHolder_LoginButton"

; www.peoplefinders.com People Search
global ID_LINK_PEOPLE_SEARCH_PAGE := "ctl00_navPeopleLink"

global PF_OLD_INPUT_FIRST_NAME := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_FirstNameTextBox"
global PF_OLD_INPUT_LAST_NAME := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_LastNameTextBox"
global PF_OLD_INPUT_CITY := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_CityTextBox"
global PF_OLD_INPUT_STATE := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_StateDropDownList"
global PF_OLD_BUTTON_PEOPLE_SEARCH := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_SearchButton"
global PF_OLD_INPUT_MI := "ctl00_ctl00_MasterContentPlaceHolder_SearchPreviewContentPlaceHolder_ctl00_MiddleNameTextBox"
global PF_OLD_BUTTON_UPDATE_SEARCH := "ctl00_ctl00_MasterContentPlaceHolder_SearchPreviewContentPlaceHolder_ctl00_SearchButton"

global PF_NEW_INPUT_FIRST_NAME := "fn"
global PF_NEW_INPUT_MIDDLE_INITIAL := "mn"
global PF_NEW_INPUT_LAST_NAME := "ln"
global PF_NEW_INPUT_CITY := "city"
global PF_NEW_INPUT_STATE := "state"

global PF_ADDR_SEARCH_ADDR := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_PeopleAddressSearchCriteria_StreetAddressTextBox"
global PF_ADDR_SEARCH_CITY := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_PeopleAddressSearchCriteria_CityTextBox"
global PF_ADDR_SEARCH_STATE := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_PeopleAddressSearchCriteria_StateDropDownList"
global PF_ADDR_SEARCH_ZIP := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_PeopleAddressSearchCriteria_ZipCodeTextBox"
global PF_ADDR_SEARCH_BUTTON := "ctl00_ctl00_MasterContentPlaceHolder_SearchCriteriaContentPlaceHolder_ctl00_PeopleAddressSearchCriteria_SearchButton"

; www.whitepages.Com
global ID_INPUT_PHONE_NUMBER := "full_phone"

#WinActivateForce

!1::peopleFindersNameSearch()			; #1

!2::switchboardReversePhoneLookup()		; #2

!3::copyLookupInfoToExcel()			; #3

!4::whitepagesReverseLookup()			; #4

!5::switchboardFindAPerson()			; #5

!6::whitepagesFindAPerson()			; #6

!7::whitepagesReverseAddress()			; #7

!8::switchboardReverseAddress()			; #8

!9::peopleFindersAddress()			; #9

!0::appendInfoToExcel()				;#10
