oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\lightgreen2.omp.json" | Invoke-Expression
Import-Module posh-git
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Import-Module -Name Terminal-Icons
$scriptpath = $env:PRIV_PYTHON_SCRIPTS
$venvpath = $env:PRIV_PYTHON_LOC
Set-Alias activate "$scriptpath\ActivateVenv.ps1"
Set-Alias create "$scriptpath\CreateVenv.ps1"
Set-Alias list "$scriptpath\ListVenv.ps1"
Set-Alias delete "$scriptpath\DeleteVenv.ps1"
Set-Alias grep "Select-String"
Set-Alias pipclean "uv pip freeze > unins ; uv pip uninstall -r unins ; del unins"

& "$venvpath\default\Scripts\Activate.ps1"
