# Jedi's Yahoo! KeyKey IME Toolbox
![GitHub all releases](https://img.shields.io/github/downloads/JediLin/YahooKeyKeyIME-Toolkit/total?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/JediLin/YahooKeyKeyIME-Toolkit?label=LATEST%20RELEASE&style=for-the-badge)\
![GitHub commits since tagged version](https://img.shields.io/github/commits-since/JediLin/YahooKeyKeyIME-Toolkit/latest?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/JediLin/YahooKeyKeyIME-Toolkit?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/JediLin/YahooKeyKeyIME-Toolkit?style=for-the-badge)

Jedi's Yahoo! KeyKey IME Toolbox 是另一個我閒暇時亂弄的東西，用來設定 Yahoo! 奇摩輸入法（Windows 版）的隱藏設定及功能。目前沒有什麼做大的打算，也沒有什麼更新時程規劃，不過若有任何使用上的意見也都歡迎回饋，如果有什麼我也覺得應該要改進的地方，我也會抽空來處理，就這樣。

請注意：這裡提供的是輔助 Yahoo! 奇摩輸入法使用的工具，不是輸入法本身。Yahoo! 奇摩輸入法雖然連官方網站都不存在了，仍然有人[備份了最後的官方正式安裝程式](https://github.com/gdxhsw/keykey_backup)，請先安裝起來再搭配這裡提供的工具使用。

## 功能

- **Yahoo! 奇摩輸入法鍵盤對應選擇介面** 可以讓 Yahoo! 奇摩輸入法搭配一百多種不同的鍵盤排列方式（例如 Dvorak）使用。\
  ![](https://jedi.org/blog/archives/ykklayoutmappermain.png)
- **Yahoo! 奇摩輸入法隱藏設定** 可以啟用及調整若干 Yahoo! 奇摩輸入法內的秘密參數與功能，讓你發揮 Yahoo! 奇摩輸入法的全部潛力。\
  ![](https://jedi.org/blog/archives/ykkeggmain.png)
  - 設定輸入緩衝區字型大小（8 pt 到 72 pt）
  - 強制以細明體作為輸入緩衝區字型
  - 變更注音輸入的鍵盤配置（[許氏鍵盤](https://bcc16.ncu.edu.tw/2/nature/DOC/chap-ad.html)或[倚天 26 鍵](https://zh.wikipedia.org/zh-tw/注音輸入法#.E5.80.9A.E5.A4.A926.E9.8D.B5.E9.8D.B5.E7.9B.A4.E6.8E.92.E5.88.97)）
  - 任意變更選字按鍵設定
  - 關閉「一點通」功能，解放你的「\`」鍵！

## 使用方法

下載 RAR 檔案解壓縮後，根據需要分別執行各檔案：

- Yahoo! 奇摩輸入法鍵盤對應選擇介面
    - 執行 `YahooKeyKeyIMELayout.exe`
    - 設定後需重新開機纔能生效
- Yahoo! 奇摩輸入法隱藏設定
    - 執行 `YahooKeyKeyIMEEgg.exe`
    - 設定後需重新登入系統纔能生效
- 建議搭配[漁村輸入法表格‧改](https://github.com/JediLin/EHQ-Symbols)

## 變更沿革

### v2021.05.30.18.27
- 新增「關閉一點通」的功能

### v2010.09.24.23.24
- 修正無法在唯讀媒體上直接執行的瑕疵（現在暫存檔案都會透過暫存路徑來處理）
- 訊息微調：輸入的緩衝區字型名稱不存在於系統上時，錯誤訊息會顯示出輸入的內容為何

### v2010.09.24.04.29
- 可以任意指定輸入緩衝區字型（預設仍為細明體）

### v2010.09.22.15.20
- Yahoo! 奇摩輸入法隱藏設定增設簡體中文及英文介面
- （開發相關）Yahoo! 奇摩輸入法隱藏設定之語系字串獨立成一個檔案（localeEgg.ahk）以便維護

### v2010.09.20.09.59
- 修正在簡體中文環境下執行時不會以簡體中文介面呈現的瑕疵（註：YahooKeyKeyIMEEgg.exe 仍然僅有繁體中文介面）

### v2010.08.29.11.30
- 修正未先檢查相關 .plist 檔案是否存在的瑕疵

### v2010.08.28.12.41
- 修正自訂選字按鍵未先轉換成 UTF-8 編碼就直接寫入 .plist 檔案的瑕疵（搭配某些歐洲鍵盤排列的時候會出問題）

### v2010.08.28.08.58
- 修正自訂選字按鍵時不會將 " < > 判斷為非法字符的瑕疵

### v2010.08.28.08.02
- Yahoo! 奇摩輸入法隱藏設定現在可任意自訂選字按鍵，並且能判斷出字符太多或太少、字符不合法、字符重用等輸入錯誤

### v2010.08.28.05.43
- 第一個公開版本

## 檔案說明
- `YahooKeyKeyIMELayout.ahk`：Yahoo! 奇摩輸入法鍵盤對應選擇介面主程式
- `locale.ahk`：Yahoo! 奇摩輸入法鍵盤對應選擇介面語系檔（請注意：這個檔案的編碼格式應該要是 **ANSI** 而不是 UTF-8）
- `YahooKeyKeyIMEEgg.ahk`：Yahoo! 奇摩輸入法隱藏設定主程式
- `localeEgg.ahk`：Yahoo! 奇摩輸入法隱藏設定語系檔（請注意：這個檔案的編碼格式應該要是 **ANSI** 而不是 UTF-8）
- `com.yahoo.KeyKey.OneKey.plist`：可以關閉一點通功能的 Yahoo! 奇摩輸入法設定檔
- `ListFonts.exe`：用來讀取作業系統字型清單的工具程式，執行後會輸出 `ListFonts.log` ，很不幸地我已經忘記這是哪裡來的了
- `YahooKeyKeyIMEConfig.ico`：圖示檔，取自 Yahoo! 奇摩輸入法的資源
- `build.ahk`：編譯打包用的腳本
- `YahooKeyKeyIME.diz`：打包成壓縮檔要加入的註解文字內容

## 編譯及打包說明
- 需要先安裝以下工具：
  - [AutoHotkey](https://www.autohotkey.com/)，要用到裡面附的 `Ahk2Exe` 工具來編譯成可執行檔。我最後編譯的時候用的是比較舊的 `1.0.48.05` 版，不保證新版可以直接用。
  - [WinRAR](https://www.rarlab.com/)
- 請注意各種工具的預設路徑寫死在 `build.ahk` 裡面，有需要可以自己改掉
- 執行 `build.ahk` 就會自動編譯打包成 RAR 格式的壓縮檔，壓縮檔的註解文字內容來自 `YahooKeyKeyIME.diz`，壓縮檔的檔名會採用當下的日期時間編碼。

## 技術細節
### 鍵盤對應

這個部分的調整，是對登錄進行操作，因此修改後需要重新開機，Windows 才會載入修改過的值。

任何安裝到 Windows 的傳統輸入法（包括 Yahoo! 奇摩輸入法）都會列在 [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts](https://learn.microsoft.com/zh-tw/windows-hardware/manufacture/desktop/windows-language-pack-default-values) 登錄機碼中，並且可以藉由修改登錄的方式，改變對應的鍵盤排列。

Yahoo! 奇摩輸入法的鍵盤標識碼是 `E0200404`，確認方式是檢查 `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E0200404` 機碼的 `Ime File` 字串值是否為 `KEYKEY.IME`；確認無誤後，要修改的目標就是這個機碼的 `Layout File` 字串，它預設的值是對應到美式 QWERTY 鍵盤排列的 `KBDUS.DLL`，若修改為 `KBDDV.DLL` 就會對應到美式 Dvorak 鍵盤排列。

同理，如果要對應到其他鍵盤排列，也是修改這個字串值，例如 `KBDUSL.DLL` 會對應到美式左手 Dvorak 鍵盤排列……要知道哪個鍵盤排列是哪個值，可以研究 Windows 預設提供的各個輸入法機碼。

### 隱藏設定

這個部分的調整，是對 `%AppData%\Yahoo! KeyKey\` 目錄內的各個 plist 設定檔進行操作，修改後需要重新登入 Windows 才會生效。

如果修改後不想要重新登入，還有一個方法是用[工作管理員](https://learn.microsoft.com/en-us/shows/inside/task-manager)把 `KeyKeyServer.exe` 這個處理程序砍掉，這樣下次啟動（切換輸入法到）Yahoo! 奇摩輸入法的時候，新的設定值就會生效。這個方法有個要注意的地方：在操作前已經使用過 Yahoo! 奇摩輸入法的那些程式也必須關閉重新啟動，否則會叫不出輸入法。

plist 設定檔都是 UTF-8 編碼的純文字檔案，原則上可以用任何比較新的純文字編輯器去修改。plist 設定檔實際上是 XML 檔案，每一個設定項目都是一個 `<key>...</key>`，其設定值就是緊接著的 `<string>...</string>`（單個值）或 `<array>...</array>`（多個值）。以下說明各項隱藏設定的項目：

- 共通設定：`com.yahoo.KeyKey.plist`
  - 輸入緩衝區字型大小：`<key>IMEUnawareComposingBufferHeightPt</key>`
  - 輸入緩衝區字型：`<key>OverrideUIFontName</key>`
- 好打注音設定：`com.yahoo.KeyKey.SmartMandarin.plist`
  - 注音鍵盤對應：`<key>KeyboardLayout</key>`
    - 許氏：`<string>Hsu</string>`
    - 倚天 26 鍵：`<string>Eten26</string>`
    - 大千：`<string>Standard</string>`
  - 選字按鍵：`<key>CandidateSelectionKeys</key>`
- 傳統注音設定：`com.yahoo.KeyKey.TraditionalMandarin.plist`
  - 注音鍵盤對應：`<key>KeyboardLayout</key>`
    - 許氏：`<string>Hsu</string>`
    - 倚天 26 鍵：`<string>Eten26</string>`
    - 大千：`<string>Standard</string>`
  - 選字按鍵：`<key>CandidateSelectionKeys</key>`
- 一點通功能設定：`com.yahoo.KeyKey.OneKey.plist`
  - 功能觸發鍵：`<key>ShortcutKey</key>`
    - 預設是 ``<string>`</string>``，改成無法觸發的按鍵，就可以在效果上關閉一點通功能，解放 `` ` `` 鍵……

