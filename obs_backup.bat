@ECHO OFF
:: Konstantin (k0nze) Luebeck, Copyright 2021
:: Twitch: https://twitch.tv/k0nze
:: Youtube: https://youtube.com/k0nze
:: Patreon: https://patreon.com/k0nze
:: Twitter: https://twitter.com/k0nze_gg
:: TikTok: https://tiktok.com/@k0nze.gg
:: Discord: https://discord.k0nze.gg

:: set backup directory path
SET "BACKUP_DIR_PATH=%UserProfile%\Documents\obs_backup"

:: set amount of days after a backup should be deleted
SET "DELETE_BACKUP_AFTER_DAYS=7"

:: path to OBS settings
SET "OBS_SETTINGS_PATH=%AppData%\obs-studio"

:: add date to backup directory
SET DATE_TIME_STRING=%date:~-4%_%date:~3,2%_%date:~0,2%-%time:~0,2%_%time:~3,2%_%time:~6,2%
SET "BACKUP_DIR_PATH_DATE=%BACKUP_DIR_PATH%\%DATE_TIME_STRING%_obs_backup"

:: make a backup directory
::MD "%BACKUP_DIR_PATH_DATE%"

:: copy files 
xcopy "%OBS_SETTINGS_PATH%" "%BACKUP_DIR_PATH_DATE%" /E/H/I

:: delete old backups
forfiles -p "%BACKUP_DIR_PATH%" -d -%DELETE_BACKUP_AFTER_DAYS% -c "cmd /c IF @isdir == TRUE rd /S /Q @path"
