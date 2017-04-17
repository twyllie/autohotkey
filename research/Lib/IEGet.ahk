IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
	SetTitleMatchMode, 2
	SetTitleMatchMode, Slow
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows {
		If instr(wb.LocationName, name) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
	}
} ;written by Jethrow 