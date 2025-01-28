oh-my-posh init pwsh --config 'C:\Users\frodeul\AppData\Local\Programs\oh-my-posh\themes\lightgreen2.omp.json' | Invoke-Expression
Import-Module posh-git
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Import-Module -Name Terminal-Icons

Set-Alias activate "D:\00_Privat_Git\PythonVenvPS1\00_Scripts\ActivateVenv.ps1"
Set-Alias create "D:\00_Privat_Git\PythonVenvPS1\00_Scripts\CreateVenv.ps1"
Set-Alias list "D:\00_Privat_Git\PythonVenvPS1\00_Scripts\ListVenv.ps1"
Set-Alias grep "Select-String"
Set-Alias delete "D:\00_Privat_Git\PythonVenvPS1\00_Scripts\DeleteVenv.ps1"
Set-Alias pipclean "uv pip freeze > unins ; uv pip uninstall -r unins ; del unins"

& "D:\00_Privat_Git\PythonVenvPS1\01_Venv\default\Scripts\Activate.ps1"
