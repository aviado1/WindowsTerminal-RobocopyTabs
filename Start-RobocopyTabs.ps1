# Start-RobocopyTabs.ps1
# Launch multiple Robocopy commands, each in its own Windows Terminal tab.
# Run from an elevated Windows Terminal PowerShell session.

param(https://github.com/aviado1/WindowsTerminal-RobocopyTabs/tree/main
    [string[]]$Commands,
    [switch]$ContinueOnMissingWT
)

if (-not $Commands -or $Commands.Count -eq 0) {
    Write-Host "No commands provided. Edit the array below or pass -Commands." -ForegroundColor Yellow
    $Commands = @(
        'robocopy "\\Source" "\\Destination" /MIR /DCOPY:T /R:1 /W:1 /V /TEE /IS /IT /XC /XN /XO',
        'robocopy "\\Source" "\\Destination" /MIR /DCOPY:T /R:1 /W:1 /V /TEE /IS /IT /XC /XN /XO',
        'robocopy "\\Source" "\\Destination" /MIR /DCOPY:T /R:1 /W:1 /V /TEE /IS /IT /XC /XN /XO'
    )
}

$wt = "$env:LOCALAPPDATA\Microsoft\Windows Terminal\wt.exe"
if (-not (Test-Path $wt)) {
    if ($ContinueOnMissingWT) {
        $wt = "wt.exe"
    } else {
        Write-Error "Windows Terminal not found at $env:LOCALAPPDATA\Microsoft\Windows Terminal\wt.exe. Install Windows Terminal or pass -ContinueOnMissingWT to try wt.exe from PATH."
        exit 1
    }
}

foreach ($cmd in $Commands) {
    Start-Process $wt -ArgumentList @(
        "-w","0",
        "new-tab","powershell",
        "-NoExit",
        "-Command",$cmd
    )
}
