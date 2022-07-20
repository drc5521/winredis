﻿; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Redis"
#define MyAppPublisher "Lucifer"
#define MyAppURL "https://github.com/X-Lucifer/winredis"
#define MyAppExeName "nssm.exe"
#define MyCopyright "Copyright © Lucifer. All Rights Reserved."
#define MyDescription "Windows Redis Service"
#define MyAppPlatform "msys2"
;动态链接库
#define MyLibRuntime "msys-2.0.dll"
#define MyLibSsl "msys-ssl-1.1.dll"
#define MyLibCrypto "msys-crypto-1.1.dll"
#define MyLibZ "msys-z.dll"
#define Suffix "lucifer"
;升级需要更新的代码块
#define MyPath "D:\Publish\Redis"
#define MyAppVersion "7.0.4"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{300D5622-0EC5-46AF-AB7E-9AE0648D0B2C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#MyPath}
OutputBaseFilename=redis-{#MyAppVersion}-{#MyAppPlatform}
SetupIconFile={#MyPath}\redis.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableReadyPage=True
DisableFinishedPage=True
AppCopyright={#MyCopyright}
EnableDirDoesntExistWarning=True
DirExistsWarning=no
UninstallDisplayIcon={uninstallexe}
UninstallDisplayName={#MyAppName}
ArchitecturesInstallIn64BitMode=x64 ia64
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyDescription}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoProductName={#MyAppName}
UsePreviousGroup=False
AppendDefaultGroupName=False

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#MyPath}\redis-{#MyAppPlatform}\nssm.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\{#MyLibRuntime}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\{#MyLibSsl}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\{#MyLibCrypto}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\{#MyLibZ}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\redis.conf"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\redis-benchmark-{#Suffix}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\redis-cli-{#Suffix}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\redis-{#MyAppPlatform}\redis-server-{#Suffix}.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Run]
Filename: "{app}\nssm.exe"; Parameters: "install Redis ""{app}\redis-server-{#Suffix}.exe"" redis.conf"; WorkingDir: "{app}\"; Description: "安装为Windows服务";
Filename: "{app}\nssm.exe"; Parameters: "set Redis DisplayName {#MyAppName}"; WorkingDir: "{app}"; Description: "设置服务名称";
Filename: "{app}\nssm.exe"; Parameters: "set Redis Description ""{#MyDescription}"""; WorkingDir: "{app}"; Description: "设置服务描述";
Filename: "{cmd}"; Parameters: " /c mklink /h ""{app}\redis-sentinel-{#Suffix}.exe"" ""{app}\redis-server-{#Suffix}.exe""";WorkingDir: "{app}\";
Filename: "{cmd}"; Parameters: " /c mklink /h ""{app}\redis-check-rdb-{#Suffix}.exe"" ""{app}\redis-server-{#Suffix}.exe""";WorkingDir: "{app}\";
Filename: "{cmd}"; Parameters: " /c mklink /h ""{app}\redis-check-aof-{#Suffix}.exe"" ""{app}\redis-server-{#Suffix}.exe""";WorkingDir: "{app}\";

[UninstallRun]
Filename: "{app}\nssm.exe"; Parameters: "stop {#MyAppName}"; 
Filename: "{app}\nssm.exe"; Parameters: "remove {#MyAppName} confirm";
Filename: "{cmd}"; Parameters: " /c del ""{app}\redis-*.exe"" /f /s /q ";WorkingDir: "{app}\";
