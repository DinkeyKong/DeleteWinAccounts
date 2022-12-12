setlocal EnableDelayedExpansion
set exclude_list="CTEAdmin" "Administrator" "Admin"
set toDelete=

FOR /f "delims=" %%a IN ('wmic UserAccount get Name') DO (
	IF "!exclude_list:%%a=!" == "%exclude_list%" (
		set toDelete=!toDelete!;%%a
	)
)

echo !toDelete!
FOR /f "delims=;" %%g IN (%toDelete%) DO (
	net user %%g /delete
)
PAUSE 