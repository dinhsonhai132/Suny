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

[Code]
function NeedsAddPath(): Boolean;
var
  OrigPath: string;
begin
  if RegQueryStringValue(
       HKLM,
       'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
       'Path',
       OrigPath) then
  begin
    Result := Pos(Uppercase(ExpandConstant('{app}')), Uppercase(OrigPath)) = 0;
  end
  else
    Result := True;
end;

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

[Registry]
; Add Suny to system PATH
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
ValueType: expandsz; ValueName: "Path"; \
ValueData: "{olddata};{app}"; \
Check: NeedsAddPath