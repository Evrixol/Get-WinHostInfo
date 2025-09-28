@echo off
powershell.exe -executionpolicy bypass .\system_info_retrieval.ps1 > %USERPROFILE%\Desktop\system_info_retrieval--output.txt
type %USERPROFILE%\Desktop\system_info_retrieval--output.txt
pause