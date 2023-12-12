$directories = Get-ChildItem -Path D:\00_Privat_Git\PythonVenvPS1\01_Venv -Directory
for($i = 0; $i -lt $directories.Count; $i++) {
    $y = $i + 1
    echo "$y. $($directories[$i].Name)"
}
