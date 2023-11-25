oh-my-posh init pwsh --config 'C:\Users\Frode\AppData\Local\Programs\oh-my-posh\themes\lightgreen2.omp.json' | Invoke-Expression
Import-Module posh-git
Import-Module -Name Terminal-Icons
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
function ezalah { eza $args --icons --git --git-repos -lah }
Set-Alias ls ezalah
Set-Alias activate "G:\PythonVenv\00_Scripts\ActivateVenv.ps1"
Set-Alias create "G:\PythonVenv\00_Scripts\CreateVenv.ps1"
Set-Alias list "G:\PythonVenv\00_Scripts\ListVenv.ps1"
& "G:\PythonVenv\01_Venv\default\Scripts\activate.ps1"
