oh-my-posh init pwsh --config $PSScriptRoot/shell.toml | Invoke-Expression 
$env:POSH_GIT_ENABLED = $true


Invoke-Expression (& { zoxide init --cmd cd powershell | Out-String })

New-Alias vim nvim

$PSStyle.FileInfo.Directory =  "`e[33;4m" # yellow underlined

