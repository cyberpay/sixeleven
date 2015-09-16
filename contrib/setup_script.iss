; also in the code
#define version "0.x.xx"

#define sourceFolder "..\release"
#define progname "611"

[Messages]
WelcomeLabel2=%nThis will install [name/ver] on your computer.%n
ClickFinish=ATTENTION:  Please note it may take a couple of hours for the initial blockchain download to complete.%n%nClick Finish to exit Setup.
ConfirmUninstall=Are you sure you want to completely remove %1 and all of its components?%n%nThis will leave blockchain data and your wallet.dat file alone.
UninstalledAll=%1 was successfully removed from your computer.%n%nThere might still be blockchain data and your wallet.dat file in %APPDATA%\611

[Setup]
AppVerName={#progname} {#version}
AppName={#progname}
DefaultDirName={pf}\{#progname}
DefaultGroupName={#progname}
UninstallDisplayIcon={uninstallexe}
Compression=lzma2/ultra
SolidCompression=yes
OutputDir=.\installer
OutputBaseFilename={#progname}_v{#version}_setup

[Files]
Source: "{#sourceFolder}\611-qt.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#sourceFolder}\..\src\611d.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#sourceFolder}\*.dll"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"
Name: desktopicon\common; Description: "For all users"; GroupDescription: "Additional icons:"; Flags: exclusive
Name: desktopicon\user; Description: "For the current user only"; GroupDescription: "Additional icons:"; Flags: exclusive unchecked
Name: quicklaunchicon; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Icons]
Name: "{group}\{#progname}"; Filename: "{app}\611-qt.exe"
Name: "{commondesktop}\611-Qt"; Filename: "{app}\611-qt.exe"; Tasks: desktopicon\common
Name: "{userdesktop}\611-Qt"; Filename: "{app}\611-qt.exe"; Tasks: desktopicon\user
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\611-Qt"; Filename: "{app}\611-qt.exe"; Tasks: quicklaunchicon
Name: "{group}\uninstall"; Filename: "{uninstallexe}";

[Run]
; info time blockchain download
Filename: "{app}\611-qt.exe"; Description: "Launch application"; Flags: postinstall skipifsilent nowait

