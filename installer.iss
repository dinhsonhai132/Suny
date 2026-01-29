[Setup]
AppName=Suny
AppVersion=1.0.0
AppPublisher=Suny Project
DefaultDirName={pf}\Suny
DefaultGroupName=Suny
DisableProgramGroupPage=yes
OutputDir=.
OutputBaseFilename=SunySetup
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Executables
Source: "Suny\suny.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Suny\osuny.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "Suny\dsuny.exe"; DestDir: "{app}"; Flags: ignoreversion

; Lib folder
Source: "Suny\Lib\*"; DestDir: "{app}\Lib"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Suny"; Filename: "{app}\suny.exe"
Name: "{group}\Uninstall Suny"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\suny.exe"; Description: "Run Suny"; Flags: nowait postinstall skipifsilent
