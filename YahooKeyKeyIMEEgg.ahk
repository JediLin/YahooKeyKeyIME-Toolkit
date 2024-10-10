#SingleInstance ignore
#Include localeEgg.ahk

Menu, Tray, Tip, %EggGuiTitle%
Menu, Tray, NoStandard
Menu, Tray, Add, %AboutItemMenuTray%, About
Menu, Tray, Default, %AboutItemMenuTray%
Menu, Tray, Click, 1
IfNotExist, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist
{
  MsgBox, 16, %TitleYKKNotFound%, %MsgYKKNotFound%
  ExitApp
}
IfNotExist, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist
{
  MsgBox, 16, %TitleYKKNotFound%, %MsgYKKNotFound%
  ExitApp
}
IfNotExist, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist
{
  MsgBox, 16, %TitleYKKNotFound%, %MsgYKKNotFound%
  ExitApp
}
IfNotExist, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.OneKey.plist
{
  MsgBox, 16, %TitleYKKNotFound%, %MsgYKKNotFound%
  ExitApp
}
Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist
{
  If A_LoopReadLine contains </dict>
  {
    KeyKeyPlistDictCloseLine := A_Index
  } else If A_LoopReadLine contains <key>IMEUnawareComposingBufferHeightPt</key>
  {
    IMEUnawareComposingBufferHeightPtKeyLine := A_Index
    IMEUnawareComposingBufferHeightPtValueLine := A_Index + 1
    FileReadLine, IMEUnawareComposingBufferHeightPtValue, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist, %IMEUnawareComposingBufferHeightPtValueLine%
    IMEUnawareComposingBufferHeightPtValue := RegExReplace(IMEUnawareComposingBufferHeightPtValue, "\s+<string>","")
    IMEUnawareComposingBufferHeightPtValue := RegExReplace(IMEUnawareComposingBufferHeightPtValue, "</string>","")
  } else If A_LoopReadLine contains <key>OverrideUIFontName</key>
  {
    OverrideUIFontNameKeyLine := A_Index
    OverrideUIFontNameValueLine := A_Index + 1
  }
}
Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist
{
  If A_LoopReadLine contains </dict>
  {
    KeyKeySmartMandarinPlistDictCloseLine := A_Index
  } else If A_LoopReadLine contains <key>KeyboardLayout</key>
  {
    SmartMandarinKeyboardLayoutKeyLine := A_Index
    SmartMandarinKeyboardLayoutValueLine := A_Index + 1
    FileReadLine, SmartMandarinKeyboardLayoutValue, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist, %SmartMandarinKeyboardLayoutValueLine%
    SmartMandarinKeyboardLayoutValue := RegExReplace(SmartMandarinKeyboardLayoutValue, "\s+<string>","")
    SmartMandarinKeyboardLayoutValue := RegExReplace(SmartMandarinKeyboardLayoutValue, "</string>","")
  } else If A_LoopReadLine contains <key>CandidateSelectionKeys</key>
  {
    SmartMandarinCandidateSelectionKeysKeyLine := A_Index
    SmartMandarinCandidateSelectionKeysValueLine := A_Index + 1
    FileReadLine, SmartMandarinCandidateSelectionKeysValue, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist, %SmartMandarinCandidateSelectionKeysValueLine%
    SmartMandarinCandidateSelectionKeysValue := RegExReplace(SmartMandarinCandidateSelectionKeysValue, "\s+<string>","")
    SmartMandarinCandidateSelectionKeysValue := RegExReplace(SmartMandarinCandidateSelectionKeysValue, "</string>","")
  }
}
Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist
{
  If A_LoopReadLine contains </dict>
  {
    KeyKeyTraditionalMandarinPlistDictCloseLine := A_Index
  } else If A_LoopReadLine contains <key>KeyboardLayout</key>
  {
    TraditionalMandarinKeyboardLayoutKeyLine := A_Index
    TraditionalMandarinKeyboardLayoutValueLine := A_Index + 1
    FileReadLine, TraditionalMandarinKeyboardLayoutValue, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist, %TraditionalMandarinKeyboardLayoutValueLine%
    TraditionalMandarinKeyboardLayoutValue := RegExReplace(TraditionalMandarinKeyboardLayoutValue, "\s+<string>","")
    TraditionalMandarinKeyboardLayoutValue := RegExReplace(TraditionalMandarinKeyboardLayoutValue, "</string>","")
  } else If A_LoopReadLine contains <key>CandidateSelectionKeys</key>
  {
    TraditionalMandarinCandidateSelectionKeysKeyLine := A_Index
    TraditionalMandarinCandidateSelectionKeysValueLine := A_Index + 1
    FileReadLine, TraditionalMandarinCandidateSelectionKeysValue, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist, %TraditionalMandarinCandidateSelectionKeysValueLine%
    TraditionalMandarinCandidateSelectionKeysValue := RegExReplace(TraditionalMandarinCandidateSelectionKeysValue, "\s+<string>","")
    TraditionalMandarinCandidateSelectionKeysValue := RegExReplace(TraditionalMandarinCandidateSelectionKeysValue, "</string>","")
  }
}
Gui, Add, Button, x210 y270 w180 h30 gYKKEggGuiClose, %ButtonCancel%
Gui, Add, CheckBox, x20 y30 w180 h15 vSetIMEUnawareComposingBufferHeightPt, %CheckBoxIMEUnawareComposingBufferHeightPt%
Gui, Add, Edit, xp+180 yp w50 Limit2 Number
Gui, Add, UpDown, vIMEUnawareComposingBufferHeightPtNew Range8-72, 36
Gui, Add, Text, yp+5 xp+55, pt
Gui, Add, CheckBox, x20 y60 w380 h30 vOverrideUIFont, %CheckBoxOverrideUIFont%
Gui, Add, CheckBox, x20 yp+40 w380 h30 vSetKeyboardLayout, %CheckBoxKeyboardLayout%
Gui, Add, Radio, xp+20 yp+30 w100 h30 vUseHsu Checked, %Hsu%
Gui, Add, Radio, xp+100 yp w100 h30 vUseEten26, %Eten26%
Gui, Add, CheckBox, x20 y170 w180 h30 vSetCandidateSelectionKeys, %CheckBoxCandidateSelectionKeys%
Gui, Add, DropDownList, xp+180 yp+5 vCandidateSelectionKeysNew, aoeu`;qjk||aoeuhtns|aoeuidht|%DropDownListCandidateSelectionKeysMyOwn%
Gui, Add, CheckBox, x20 y210 w380 h30 vDisableOnekey, %CheckBoxDisableOnekey%
Gui, Add, Button, x10 y270 w180 h30 gApplyEgg, %ButtonOK%
Gui +LabelYKKEggGui
Gui, Show, xCenter yCenter w400 h320, %EggGuiTitle%
Return

ApplyEgg:
Gui, Submit
If (SetIMEUnawareComposingBufferHeightPt > 0 or OverrideUIFont > 0) {
  IfExist, %A_Temp%\com.yahoo.KeyKey.plist.temp
  {
    FileSetAttrib, -RHS, %A_Temp%\com.yahoo.KeyKey.plist.temp
    FileDelete, %A_Temp%\com.yahoo.KeyKey.plist.temp
  }
  Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist
  {
    If (SetIMEUnawareComposingBufferHeightPt > 0 and OverrideUIFont > 0) {
      If (A_Index != IMEUnawareComposingBufferHeightPtKeyLine and A_Index != IMEUnawareComposingBufferHeightPtValueLine and A_Index != OverrideUIFontNameKeyLine and A_Index != OverrideUIFontNameValueLine) {
        If (A_Index = KeyKeyPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.plist.temp
      }
    } else If (SetIMEUnawareComposingBufferHeightPt > 0) {
      If (A_Index != IMEUnawareComposingBufferHeightPtKeyLine and A_Index != IMEUnawareComposingBufferHeightPtValueLine) {
        If (A_Index = KeyKeyPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.plist.temp
      }
    } else If (OverrideUIFont > 0) {
      If (A_Index != OverrideUIFontNameKeyLine and A_Index != OverrideUIFontNameValueLine) {
        If (A_Index = KeyKeyPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.plist.temp
      }
    }
  }
  If (SetIMEUnawareComposingBufferHeightPt > 0) {
    FileAppend, %A_Tab%<key>IMEUnawareComposingBufferHeightPt</key>`n%A_Tab%<string>%IMEUnawareComposingBufferHeightPtNew%</string>`n, %A_Temp%\com.yahoo.KeyKey.plist.temp
  }
  If (OverrideUIFont > 0) {
    IfExist, %A_Temp%\ListFonts.exe
    {
      FileSetAttrib, -RHS, %A_Temp%\ListFonts.exe
      FileDelete, %A_Temp%\ListFonts.exe
    }
    FileInstall, ListFonts.exe, %A_Temp%\ListFonts.exe, 1
    IfExist, %A_Temp%\ListFonts.log
    {
      FileSetAttrib, -RHS, %A_Temp%\ListFonts.log
      FileDelete, %A_Temp%\ListFonts.log
    }
    RunWait, %comspec% /c "%A_Temp%\ListFonts.exe > %A_Temp%\ListFonts.log", , Hide
    FileSetAttrib, -RHS, %A_Temp%\ListFonts.exe
    FileDelete, %A_Temp%\ListFonts.exe
    FileRead, ListFonts, %A_Temp%\ListFonts.log
    FileSetAttrib, -RHS, %A_Temp%\ListFonts.log
    FileDelete, %A_Temp%\ListFonts.log
    ListFonts := RegExReplace(ListFonts, "name: ")
    InputBufferFontName:
    InputBox, BufferFont, %TitleOverrideUIFont%, %MsgOverrideUIFont%, , , , , , , , %MingLiUName%
    Loop, Parse, ListFonts, `n, `r
    {
      If A_LoopField contains %BufferFont%
      {
        CheckFontMatch = 1
      }
    }
    If (CheckFontMatch != 1) {
      MsgBox, 16, %TitleOverrideUIFontIllegal%, %MsgOverrideUIFontIllegal1%`n`n%BufferFont%`n`n%MsgOverrideUIFontIllegal2%
      Goto, InputBufferFontName
    }
    ClipSaved := ClipboardAll
    clipboard =
    clipboard = %BufferFont%
    ClipWait
    ; The following command is not available in Unicode version of AutoHotkey
    ; Also cause double-encode and break things.
    ; TODO: drop older Windows support or check Windows version first?
    ; Transform, BufferFont, Unicode
    clipboard := ClipSaved
    ClipSaved =
    FileAppend, %A_Tab%<key>OverrideUIFontName</key>`n%A_Tab%<string>%BufferFont%</string>`n, %A_Temp%\com.yahoo.KeyKey.plist.temp
  }
  FileAppend, </dict>`n</plist>, %A_Temp%\com.yahoo.KeyKey.plist.temp
  FileSetAttrib, -RHS, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist
  FileMove, %A_Temp%\com.yahoo.KeyKey.plist.temp, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.plist, 1
}
KeyboardLayoutOrCandidateSelectionKeys:
If (SetKeyboardLayout > 0 or SetCandidateSelectionKeys > 0) {
  If (SetCandidateSelectionKeys > 0 and CandidateSelectionKeysNew = DropDownListCandidateSelectionKeysMyOwn) {
    InputBox, CandidateSelectionKeysNew, %TitleCandidateSelectionKeysNew%, %MsgCandidateSelectionKeysNew%
    If ErrorLevel
    {
      SetCandidateSelectionKeys = 0
      Goto, KeyboardLayoutOrCandidateSelectionKeys
    }
    StringLen, CandidateSelectionKeysNewLength, CandidateSelectionKeysNew
    If (CandidateSelectionKeysNewLength < 8 or CandidateSelectionKeysNewLength > 10) {
      MsgBox, 16, %TitleCandidateSelectionKeysNewLengthError%, %MsgCandidateSelectionKeysNewLengthError%
      CandidateSelectionKeysNew = %DropDownListCandidateSelectionKeysMyOwn%
      Goto, KeyboardLayoutOrCandidateSelectionKeys
    }
    StringLower, CandidateSelectionKeysNew, CandidateSelectionKeysNew
    If CandidateSelectionKeysNew contains ~,!,@,#,$,`%,^,&,*,(,),{,},",<,>,?,+,|,_,:,%A_Space%,%A_Tab%
    ; "
    {
      MsgBox, 16, %TitleCandidateSelectionKeysNewIllegal%, %MsgCandidateSelectionKeysNewIllegal%
      CandidateSelectionKeysNew = %DropDownListCandidateSelectionKeysMyOwn%
      Goto, KeyboardLayoutOrCandidateSelectionKeys
    }
    TestKey = ``
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 1
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 2
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 3
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 4
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 5
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 6
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 7
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 8
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = 9
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = a
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = b
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = c
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = d
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = e
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = f
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = g
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = h
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = i
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = j
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = k
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = l
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = m
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = n
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = o
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = p
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = q
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = r
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = s
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = t
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = u
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = v
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = w
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = x
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = y
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = z
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = [
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = ]
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = '
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = ,
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = .
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = `;
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = /
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = =
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = \
    Gosub, CandidateSelectionKeysNewArrayTest
    TestKey = -
    Gosub, CandidateSelectionKeysNewArrayTest
    ClipSaved := ClipboardAll
    clipboard =
    clipboard = %CandidateSelectionKeysNew%
    ClipWait
    ; The following command is not available in Unicode version of AutoHotkey
    Transform, CandidateSelectionKeysNew, Unicode
    clipboard := ClipSaved
    ClipSaved =
  }
  IfExist, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
  {
    FileSetAttrib, -RHS, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
    FileDelete, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
  }
  Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist
  {
    If (SetKeyboardLayout > 0 and SetCandidateSelectionKeys > 0) {
      If (A_Index != SmartMandarinKeyboardLayoutKeyLine and A_Index != SmartMandarinKeyboardLayoutValueLine and A_Index != SmartMandarinCandidateSelectionKeysKeyLine and A_Index != SmartMandarinCandidateSelectionKeysValueLine) {
        If (A_Index = KeyKeySmartMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
      }
    } else If (SetKeyboardLayout > 0) {
      If (A_Index != SmartMandarinKeyboardLayoutKeyLine and A_Index != SmartMandarinKeyboardLayoutValueLine) {
        If (A_Index = KeyKeySmartMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
      }
    } else If (SetCandidateSelectionKeys > 0) {
      If (A_Index != SmartMandarinCandidateSelectionKeysKeyLine and A_Index != SmartMandarinCandidateSelectionKeysValueLine) {
        If (A_Index = KeyKeySmartMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
      }
    }
  }
  If (SetKeyboardLayout > 0) {
    If (UseHsu > 0) {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Hsu</string>`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
    } else If (UseEten26 > 0) {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Eten26</string>`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
    } else {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Standard</string>`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
    }
  }
  If (SetCandidateSelectionKeys > 0) {
    FileAppend, %A_Space%   <key>CandidateSelectionKeys</key>`n    <string>%CandidateSelectionKeysNew%</string>`n, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
  }
  FileAppend, %A_Space% </dict>`n</plist>, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp
  FileSetAttrib, -RHS, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist
  FileMove, %A_Temp%\com.yahoo.KeyKey.SmartMandarin.plist.temp, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.SmartMandarin.plist, 1
  IfExist, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
  {
    FileSetAttrib, -RHS, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
    FileDelete, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
  }
  Loop, Read, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist
  {
    If (SetKeyboardLayout > 0 and SetCandidateSelectionKeys > 0) {
      If (A_Index != TraditionalMandarinKeyboardLayoutKeyLine and A_Index != TraditionalMandarinKeyboardLayoutValueLine and A_Index != TraditionalMandarinCandidateSelectionKeysKeyLine and A_Index != TraditionalMandarinCandidateSelectionKeysValueLine) {
        If (A_Index = KeyKeyTraditionalMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
      }
    } else If (SetKeyboardLayout > 0) {
      If (A_Index != TraditionalMandarinKeyboardLayoutKeyLine and A_Index != TraditionalMandarinKeyboardLayoutValueLine) {
        If (A_Index = KeyKeyTraditionalMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
      }
    } else If (SetCandidateSelectionKeys > 0) {
      If (A_Index != TraditionalMandarinCandidateSelectionKeysKeyLine and A_Index != TraditionalMandarinCandidateSelectionKeysValueLine) {
        If (A_Index = KeyKeyTraditionalMandarinPlistDictCloseLine) {
          break
        }
        FileAppend, %A_LoopReadLine%`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
      }
    }
  }
  If (SetKeyboardLayout > 0) {
    If (UseHsu > 0) {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Hsu</string>`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
    } else If (UseEten26 > 0) {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Eten26</string>`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
    } else {
      FileAppend, %A_Space%   <key>KeyboardLayout</key>`n    <string>Standard</string>`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
    }
  }
  If (SetCandidateSelectionKeys > 0) {
    FileAppend, %A_Space%   <key>CandidateSelectionKeys</key>`n    <string>%CandidateSelectionKeysNew%</string>`n, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
  }
  FileAppend, %A_Space% </dict>`n</plist>, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp
  FileSetAttrib, -RHS, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist
  FileMove, %A_Temp%\com.yahoo.KeyKey.TraditionalMandarin.plist.temp, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.TraditionalMandarin.plist, 1
}
If (DisableOnekey > 0) {
  FileCopy, com.yahoo.KeyKey.OneKey.plist, %AppData%\Yahoo! KeyKey\com.yahoo.KeyKey.OneKey.plist, 1
}
If (SetIMEUnawareComposingBufferHeightPt > 0 or OverrideUIFont > 0 or SetKeyboardLayout > 0 or SetCandidateSelectionKeys > 0) {
  MsgBox, 36, %TitleDone%, %MsgNeedRelogin%
  IfMsgBox Yes
    Shutdown, 4
}
ExitApp

YKKEggGuiClose:
Gui, Destroy
ExitApp

About:
MsgBox, 64, %AboutItemMenuTray%, %ProjectHome%`n`n`n`n%Copyright%`n`n%License%`n%LicenseURL%`n
return

CandidateSelectionKeysNewArrayTest:
StringSplit, CandidateSelectionKeysNewArray, CandidateSelectionKeysNew, %TestKey%
If (CandidateSelectionKeysNewArray0 > 2) {
  MsgBox, 16, %TitleCandidateSelectionKeysNewDuplicated%, %MsgCandidateSelectionKeysNewDuplicated%
  CandidateSelectionKeysNew = %DropDownListCandidateSelectionKeysMyOwn%
  Goto, KeyboardLayoutOrCandidateSelectionKeys
}
return
