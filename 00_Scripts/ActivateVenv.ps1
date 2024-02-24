$path = "G:\PythonVenv\01_Venv"
$directories = Get-ChildItem -Path $path -Directory
$pathpython = "\scripts\activate.ps1"

Write-Host "Chose the environment you want to activate:"
for($i = 0; $i -lt $directories.Count; $i++) {
    $y = $i + 1
    Write-Host "$y. $($directories[$i].Name)"
}
$selected = Read-Host "Enter your choice"
$correctInput = $selected - 1
$choice = "$($directories[$correctInput].Name)"
if($correctInput -ge 0 -and $correctInput -lt $directories.Count) {
    $newPath = Join-Path $path $choice $pathpython
    & $newPath
}
