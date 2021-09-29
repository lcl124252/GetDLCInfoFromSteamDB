@ECHO OFF
:: WINDOWS WORKING DIR BUG WORKAROUND
CD /D "%~dp0"
:: CHECK APPLIST DIR
IF EXIST .\\AppList RMDIR /S /Q .\\AppList
:: CREATE APPLIST DIR
MKDIR .\\AppList
:: CREATE DLCS FILES FOR __[data]name[/data]__
ECHO [data]appID[/data]> .\\AppList\\0.txt
[dlcs fromZero="true"]:: {dlc_name}\nECHO {dlc_id}> .\\AppList\\{dlc_index}.txt\n[/dlcs]
:: START GREENLUMA 2020
IF EXIST .\\DLLInjector.exe GOTO :Q
GOTO :EXIT
:Q
SET /P c=Do you want to start GreenLuma 2020 [Y/N]?
IF /I "%c%" EQU "Y" GOTO :START
IF /I "%c%" EQU "N" GOTO :EXIT
GOTO :Q
:START
CLS
ECHO Launching Greenluma 2020 - APPID [data]appID[/data] - APPNAME [data]name[/data]
TASKKILL /F /IM steam.exe
TIMEOUT /T 2
DLLInjector.exe -DisablePreferSystem32Images
:EXIT
EXIT
