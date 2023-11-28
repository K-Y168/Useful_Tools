:機器によって変化するレジストリパスを環境変数HOGEに格納するプログラム

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
@powershell start-process %~0 -verb runas
exit
)

REG QUERY HKU /f S-1-5-21 > %USERPROFILE%\hoge.txt

@powershell -command "gc "C:\Users\%USERNAME%\hoge.txt"　| ? { $_  -notmatch '<<削除したい行に含まれる値>>'　-and $_ -notmatch '<<削除したい行に含まれる値>>' -and $_ -ne '' }" > "C:\Users\%USERNAME%\hoge2.txt"

for /f "usebackq delims=;" %%A in ("C:\Users\%USERNAME%\hoge2.txt") do (set HOGE=%%A)


del /s /q "%USERPROFILE%\hoge.txt"

del /s /q "%USERPROFILE%\hoge2.txt"



