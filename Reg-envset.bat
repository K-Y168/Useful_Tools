:�@��ɂ���ĕω����郌�W�X�g���p�X�����ϐ�HOGE�Ɋi�[����v���O����

::�Ǘ��Ҍ����ɏ��i

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
@powershell start-process %~0 -verb runas
exit
)


::���W�X�g���̌����l�ŌŒ�̕�������������āuhoge.txt�v�Ɋi�[

REG QUERY HKU /f S-1-5-21 > %USERPROFILE%\hoge.txt


::�uhoge.txt�v�̒l��powershell�ŉ��H���A�uhoge2.txt�v�Ɋi�[

@powershell -command "gc "C:\Users\%USERNAME%\hoge.txt"�@| ? { $_  -notmatch '<<�폜�������s�Ɋ܂܂��l>>'�@-and $_ -notmatch '<<�폜�������s�Ɋ܂܂��l>>' -and $_ -ne '' }" > "C:\Users\%USERNAME%\hoge2.txt"


::�uhoge2.txt�v�̒l��ϐ�HOGE�Ɋi�[

for /f "usebackq delims=;" %%A in ("C:\Users\%USERNAME%\hoge2.txt") do (set HOGE=%%A)


::���쐬����.txt�t�@�C�����폜

del /s /q "%USERPROFILE%\hoge.txt"

del /s /q "%USERPROFILE%\hoge2.txt"



