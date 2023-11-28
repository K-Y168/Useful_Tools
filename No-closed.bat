::実行後にプロセスが完了し、コマンドが次へ進まないようにするプログラム

:loop
TIMEOUT /T 3 /nobreak > nul
tasklist | find "Setup.exe" > nul

if %ERRORLEVEL% == 0 (set UACA=0) else (set UACA=1)

if %UACA% == 0 (goto loop) else (set UACA=)

