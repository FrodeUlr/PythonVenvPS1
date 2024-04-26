$path = $env:PRIV_PYTHON_LOC
$directories = Get-ChildItem -Path $path -Directory
Write-Host "Chose the environment to delete"
$directories | ForEach-Object -Begin { $i = 1 } -Process { Write-Host "$i. $($_.Name)"; $i++ }
while ($true) {
    try {
        [int]$choice = Read-Host "Enter the number of the environment to delete"
        if ($choice -ge 1 -and $choice -lt $directories.Count + 1) {
            $venv = $directories[$choice - 1]
            Write-Host "Deleting environment $venv"
            Remove-Item -Path $venv.FullName -Recurse -Force
            exit 0
        }
        else {
            Write-Host "Invalid choice"
        }
    } catch {
        Write-Host "Invalid choice"
    }
}
