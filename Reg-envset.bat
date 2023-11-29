:機器によって変化するレジストリパスを環境変数HOGEに格納するプログラム

::管理者権限に昇格

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
@powershell start-process %~0 -verb runas
exit
)


::レジストリの検索値で固定の文字列を検索して「hoge.txt」に格納

REG QUERY HKU /f S-1-5-21 > %USERPROFILE%\hoge.txt


::「hoge.txt」の値をpowershellで加工し、「hoge2.txt」に格納

@powershell -command "gc "C:\Users\%USERNAME%\hoge.txt"　| ? { $_  -notmatch '<<削除したい行に含まれる値>>'　-and $_ -notmatch '<<削除したい行に含まれる値>>' -and $_ -ne '' }" > "C:\Users\%USERNAME%\hoge2.txt"


::「hoge2.txt」の値を変数HOGEに格納

for /f "usebackq delims=;" %%A in ("C:\Users\%USERNAME%\hoge2.txt") do (set HOGE=%%A)


::仮作成した.txtファイルを削除

del /s /q "%USERPROFILE%\hoge.txt"

del /s /q "%USERPROFILE%\hoge2.txt"



