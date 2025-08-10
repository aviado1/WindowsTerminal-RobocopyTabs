# WindowsTerminal Robocopy Tabs

Launch multiple Robocopy commands, each in its own Windows Terminal tab. Useful for parallel copy jobs while preserving clear per job output.

## Prerequisites
- Windows Terminal installed
- Run from an elevated PowerShell session

## Usage
Edit the commands array in `Start-RobocopyTabs.ps1` or pass your own list.

Inline example:
```powershell
.\Start-RobocopyTabs.ps1 -Commands @(
 'robocopy "\\SourceA" "\\DestA" /MIR /DCOPY:T /R:1 /W:1 /V /TEE /IS /IT /XC /XN /XO',
 'robocopy "\\SourceB" "\\DestB" /MIR /DCOPY:T /R:1 /W:1 /V /TEE /IS /IT /XC /XN /XO'
)
