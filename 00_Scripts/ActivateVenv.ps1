$path = $env:PRIV_PYTHON_LOC
$scripts = $env:PRIV_PYTHON_SCRIPTS

if ($null -eq $path -or -not (Test-Path -Path $path)) {
  Write-Host "Environment variable PRIV_PYTHON_LOC is not correctly set" -ForegroundColor Red
  exit 1
  }

if ($null -eq $scripts -or -not (Test-Path -Path $scripts)) {
  Write-Host "Environment variable PRIV_PYTHON_SCRIPTS is not correctly set" -ForegroundColor Red
  exit 1
}

$directories = Get-ChildItem -Path $path -Directory
$pathpython = "\scripts\activate.ps1"
Write-Host "Available environment(s):" -ForegroundColor Cyan

Invoke-Expression "$scripts\ListVenv.ps1"

while ($true) {
    Write-Host "Enter the number of the environment to activate (q to quit)" -ForegroundColor Cyan
    $selected = Read-Host
    if($selected -eq "q") {
        break
    }
    try {
        $selected = [int]$selected
        if($selected -ge 1 -and $selected -le $directories.Count) {
            $correctInput = $selected - 1
            $choice = "$($directories[$correctInput].Name)"
            $newPath = Join-Path $path $choice $pathpython
            & $newPath
            break
        }
        throw
    }
    catch {
        Write-Host "Invalid input. Please try again." -ForegroundColor Red
        continue
    }
}
