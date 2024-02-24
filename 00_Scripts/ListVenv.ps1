$directories = Get-ChildItem -Path G:\PythonVenv\01_Venv -Directory
for($i = 0; $i -lt $directories.Count; $i++) {
    $y = $i + 1
    Write-Host "$y. $($directories[$i].Name)"
}
