#SingleInstance ignore
#Include locale.ahk

Menu, Tray, Tip, %GuiTitle%
Menu, Tray, NoStandard
Menu, Tray, Add, %AboutItemMenuTray%, About
Menu, Tray, Default, %AboutItemMenuTray%
Menu, Tray, Click, 1

DvorakLayoutFile = kbddv.dll
USLayoutFile = kbdus.dll

Loop, HKLM, SYSTEM\CurrentControlSet\Control\Keyboard Layouts, 1, 1
{
  if (A_LoopRegName = "Ime File") {
    RegRead, CurrentImeFile
    if (CurrentImeFile = "KEYKEY.IME") {
      YKKRegSubKey = %A_LoopRegSubKey%
    }
  }
}
If (YKKRegSubKey = "") {
  MsgBox, 16, %TitleYKKNotFound%, %MsgYKKNotFound%
  ExitApp
}
RegRead, YKKLayoutFile, HKLM, %YKKRegSubKey%, Layout File
SplitPath, YKKLayoutFile, , , , YKKLayoutFileNoExt
YKKCurrentLayoutFile := %YKKLayoutFileNoExt%
If (YKKCurrentLayoutFile = "") {
  YKKCurrentLayoutFile = %YKKLayoutFile%
}
Gui, Add, Button, x20 y200 w360 h30 gYKKGuiClose, %ButtonCancel%
Gui, Add, Text, x20 y10 w360 h60 Center, %TextCurrent%`n`n%YKKCurrentLayoutFile% %TextKeyboardLayout%
If (YKKLayoutFile = USLayoutFile) {
  Gui, Add, Button, x20 y80 w360 h30 gSetDvorak, %ButtonSetDvorak%
  Gui, Add, Button, x20 y120 w360 h30 gSetUS Disabled, %ButtonSetUS%
} else If (YKKLayoutFile = DvorakLayoutFile) {
  Gui, Add, Button, x20 y80 w360 h30 gSetDvorak Disabled, %ButtonSetDvorak%
  Gui, Add, Button, x20 y120 w360 h30 gSetUS, %ButtonSetUS%
} else {
;If (YKKLayoutFile != USLayoutFile and YKKLayoutFile != DvorakLayoutFile) {
  Gui, Add, Button, x20 y80 w360 h30 gSetDvorak, %ButtonSetDvorak%
  Gui, Add, Button, x20 y120 w360 h30 gSetUS, %ButtonSetUS%
}
Gui, Add, Button, x20 y160 w360 h30 gCustomize, %ButtonCustomize%
Gui +LabelYKKGui
Gui, Show, xCenter yCenter w400 h250, %GuiTitle%
Return

SetUS:
Gui, Submit
RegWrite, REG_SZ, HKLM, %YKKRegSubKey%, Layout File, %USLayoutFile%
RegRead, YKKLayoutFile, HKLM, %YKKRegSubKey%, Layout File
SplitPath, YKKLayoutFile, , , , YKKLayoutFileNoExt
YKKCurrentLayoutFile := %YKKLayoutFileNoExt%
If (YKKCurrentLayoutFile = "") {
  YKKCurrentLayoutFile = %YKKLayoutFile%
}
MsgBox, 36, %TitleDone%, %TextCurrent%`n`n%YKKCurrentLayoutFile%`n`n`n%MsgNeedReboot%
IfMsgBox Yes
  Shutdown, 6
ExitApp

SetDvorak:
Gui, Submit
RegWrite, REG_SZ, HKLM, %YKKRegSubKey%, Layout File, %DvorakLayoutFile%
RegRead, YKKLayoutFile, HKLM, %YKKRegSubKey%, Layout File
SplitPath, YKKLayoutFile, , , , YKKLayoutFileNoExt
YKKCurrentLayoutFile := %YKKLayoutFileNoExt%
If (YKKCurrentLayoutFile = "") {
  YKKCurrentLayoutFile = %YKKLayoutFile%
}
MsgBox, 36, %TitleDone%, %TextCurrent%`n`n%YKKCurrentLayoutFile%`n`n`n%MsgNeedReboot%
IfMsgBox Yes
  Shutdown, 6
ExitApp

Customize:
Gui, Submit
Select:
FileSelectFile, SelectLayoutFile, 1, %A_WinDir%\system32\kbdus.dll, %TitleSelectLayoutFile%, %FileTypeLayoutFile% (kbd*.dll)
If (SelectLayoutFile = "") {
  ExitApp
}
SplitPath, SelectLayoutFile, SelectLayoutFileName, , , SelectLayoutFileNoExt
YKKNewLayoutFile := %SelectLayoutFileNoExt%
If (YKKNewLayoutFile = "") {
  YKKNewLayoutFile = %SelectLayoutFile%
}
MsgBox, 35, %TitleConfirmLayout%, %MsgConfirmLayout% %YKKNewLayoutFile% %TextKeyboardLayout%?
IfMsgBox Yes
  RegWrite, REG_SZ, HKLM, %YKKRegSubKey%, Layout File, %SelectLayoutFileName%
IfMsgBox No
  Goto, Select
IfMsgBox Cancel
  ExitApp
RegRead, YKKLayoutFile, HKLM, %YKKRegSubKey%, Layout File
SplitPath, YKKLayoutFile, , , , YKKLayoutFileNoExt
YKKCurrentLayoutFile := %YKKLayoutFileNoExt%
If (YKKCurrentLayoutFile = "") {
  YKKCurrentLayoutFile = %YKKLayoutFile%
}
MsgBox, 36, %TitleDone%, %TextCurrent%`n`n%YKKCurrentLayoutFile%`n`n`n%MsgNeedReboot%
IfMsgBox Yes
  Shutdown, 6
ExitApp

YKKGuiClose:
Gui, Destroy
ExitApp

About:
MsgBox, 64, %AboutItemMenuTray%, %ProjectHome%`n`n`n`n%Copyright%`n`n%License%`n%LicenseURL%`n
return
