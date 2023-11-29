::インストーラー起動後にコマンドが次へ進まないようにするプログラム

::インストール中に起動しているプロセスが修了するまでループ

:loop
TIMEOUT /T 3 /nobreak > nul

::<<プロセス名>>が実行されているか確認する

tasklist | find "<<プロセス名>>" > nul

::<<プロセス名>>が実行されていれば、:loopへジャンプ

if %ERRORLEVEL% == 0 (set UACA=0) else (set UACA=1)

if %UACA% == 0 (goto loop) else (set UACA=)

