$path = "G:\PythonVenv\01_Venv"
$directories = Get-ChildItem -Path $path -Directory
Write-Host "Chose the environment to delete"
$directories | ForEach-Object -Begin { $i = 1 } -Process { Write-Host "$i. $($_.Name)"; $i++ }
[int]$choice = Read-Host "Enter the number of the environment to delete"
if ($choice -ge 0 -and $choice -lt $directories.Count) {) {
    $venv = $directories[$choice - 1]
    Write-Host "Deleting environment $venv"
    Remove-Item -Path $venv.FullName -Recurse -Force
    exit 0
})
else {
    Write-Host "Invalid choice"
    exit 1
}

