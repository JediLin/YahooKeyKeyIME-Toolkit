#SingleInstance
VerNo = %A_YYYY%.%A_MM%.%A_DD%.%A_Hour%.%A_Min%
WinRARFullPath = c:\Program Files\WinRAR\WinRAR.exe

IfExist, YahooKeyKeyIMELayout.exe
{
  FileSetAttrib, -RHS, YahooKeyKeyIMELayout.exe
  FileDelete, YahooKeyKeyIMELayout.exe
}
IfExist, YahooKeyKeyIMEEgg.exe
{
  FileSetAttrib, -RHS, YahooKeyKeyIMEEgg.exe
  FileDelete, YahooKeyKeyIMEEgg.exe
}
RunWait, ..\Ahk2Exe\Ahk2Exe.exe /in ..\YahooKeyKeyIME\YahooKeyKeyIMELayout.ahk /out ..\YahooKeyKeyIME\YahooKeyKeyIMELayout.exe /icon ..\YahooKeyKeyIME\YahooKeyKeyIMEConfig.ico
RunWait, ..\Ahk2Exe\Ahk2Exe.exe /in ..\YahooKeyKeyIME\YahooKeyKeyIMEEgg.ahk /out ..\YahooKeyKeyIME\YahooKeyKeyIMEEgg.exe /icon ..\YahooKeyKeyIME\YahooKeyKeyIMEConfig.ico
RunWait, %WinRARFullPath% a -afrar -av -ep1 -k -m5 -md4096 -r- -rr10p -s -t -tk -zYahooKeyKeyIME.diz Release\YahooKeyKeyIMEToolbox-%VerNo%.rar YahooKeyKeyIMELayout.exe YahooKeyKeyIMEEgg.exe com.yahoo.KeyKey.OneKey.plist
ExitApp
