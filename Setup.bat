@echo off

 :-----------------------------------------------------------------------------------------------------------------------------
REM  ������ ������ Ȯ���մϴ�.
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM ���� �÷��װ� �����Ǿ� ������ ������ ������ �����ϴ�.
if '%errorlevel%' NEQ '0' (goto UACPrompt) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    REM ������ �������� �����ϴ� ��� �⺻ ��ΰ� �޶�, �̸� bat���� ���(%~dp0)�� �����Ѵ�
    CD /D "%~dp0"
:-----------------------------------------------------------------------------------------------------------------------------

echo [Build Sharpmake]
dotnet build --configuration Release .\Engine\Source\Programs\Sharpmake\Sharpmake.Application\Sharpmake.Application.csproj

pause