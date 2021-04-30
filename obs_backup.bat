@ECHO OFF
:: Konstantin (k0nze) Luebeck, Copyright 2021
:: Twitch: https://twitch.tv/k0nze
:: Youtube: https://youtube.com/k0nze
:: Patreon: https://patreon.com/k0nze
:: Twitter: https://twitter.com/k0nze_gg
:: TikTok: https://tiktok.com/@k0nze.gg
:: Discord: https://discord.k0nze.gg

:: path to backup directory
SET "BACKUP_DIR_PATH=%UserProfile%\Documents\obs_backup"

:: path to OBS settings
SET "OBS_SETTINGS_PATH=%AppData%\obs-studio"

:: add date to backup directory
SET DATE_TIME_STRING=%date:~-4%_%date:~3,2%_%date:~0,2%-%time:~0,2%_%time:~3,2%_%time:~6,2%
SET "BACKUP_DIR_PATH=%BACKUP_DIR_PATH%\%DATE_TIME_STRING%_obs_backup"

:: make a backup directory
MD %BACKUP_DIR_PATH%

:: copy files 
xcopy %OBS_SETTINGS_PATH% %BACKUP_DIR_PATH% /E/H/I