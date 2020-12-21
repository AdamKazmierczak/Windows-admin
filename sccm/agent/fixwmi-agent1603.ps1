net stop winmgmt /y
cd "c:\program files\Microsoft Policy Platform"
for /f "delims=" %%s in ('dir /b /s *.dll') do regsvr32 /s %%s
for /f "delims=" %%s in ('dir /b *.mof') do mofcomp %%s
for /f "delims=" %%s in ('dir /b *.mfl') do mofcomp %%s
net start winmgmt
pause