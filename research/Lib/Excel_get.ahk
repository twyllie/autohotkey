Excel_Get(WinTitle="ahk_class XLMAIN", Excel7#=1) {
  WinGetClass, WinClass, %WinTitle%
  if (WinClass == "XLMAIN") {
    ControlGet, hwnd, hwnd, , Excel7%Excel7#%, %WinTitle%
    if Not ErrorLevel {
      window := Acc_ObjectFromWindow(hwnd, -16)
      if ComObjType(window) = 9
        while Not xl
          try xl := window.application
          catch e
            if SubStr(e.message,1,10) = "0x80010001"
              ControlSend, Excel7%Excel7#%, {Esc}, %WinTitle%
            else
              return "Error accessing the application object."
    }
  }
  return xl
}