if ((get-host).version.major -lt 7)
{
    Write-Output "please install the right powershell with: winget install Microsoft.Powershell"
    exit 1
}

# install oh-my-posh
if (-not (Get-Command oh-my-posh -errorAction SilentlyContinue))
{
    winget install JanDeDobbeleer.OhMyPosh
}


# link profile
rm $PROFILE
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $PSScriptRoot/profile.ps1

# link shell
$ShellLocation = "$(Split-Path -parent $PROFILE)/shell.toml"
rm $ShellLocation
New-Item -ItemType SymbolicLink -Path $ShellLocation -Target $PSScriptRoot/shell.toml

# link windows terminal settings
$TerminalSettingsLocation = "$($env:LocalAppData)/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
rm $TerminalSettingsLocation
New-Item -ItemType SymbolicLink -Path $TerminalSettingsLocation -Target $PSScriptRoot/terminal_settings.json

