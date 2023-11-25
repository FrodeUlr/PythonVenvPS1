$directories = Get-ChildItem -Path G:\PythonVenv\01_Venv -Directory
$path = "G:\PythonVenv\01_venv"
$pathpython = "\scripts\activate.ps1"

echo "Chose the environment you want to activate:"
for($i = 0; $i -lt $directories.Count; $i++) {
    $y = $i + 1
    echo "$y. $($directories[$i].Name)"
}
$selected = Read-Host "Enter your choice"
$correctInput = $selected - 1
$choice = "$($directories[$correctInput].Name)"
if($correctInput -ge 0 -and $correctInput -lt $directories.Count) {
    $newPath = Join-Path $path $choice $pathpython
    & $newPath
}
