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
Write-Host "Chose the environment to delete" -ForegroundColor Cyan
Invoke-Expression "$scripts\ListVenv.ps1"

while ($true) {
  Write-Host "Enter the number of the environment to delete(q to quit)" -ForegroundColor Cyan
  $choice = Read-Host
  if($choice -eq "q") {
    break
  }
  try {
    $choice = [int]$choice
    if ($choice -ge 1 -and $choice -lt $directories.Count + 1) {
      $venv = $directories[$choice - 1]
      Write-Host "Are you sure you want to delete environment:" -ForegroundColor Yellow
      Write-Host "$venv ? (y/n)" -ForegroundColor Red
      $confirm = Read-Host
      if ($confirm -ne "y") {
        Write-Host "Environment $venv not deleted" -ForegroundColor Yellow
        break
      }
      Write-Host "Deleting environment $venv" -ForegroundColor Yellow
      Remove-Item -Path $venv.FullName -Recurse -Force
      Write-Host "Environment $venv deleted" -ForegroundColor Green
      break
    }
    else {
      Write-Host "Invalid choice" -ForegroundColor Red
  }
  } catch {
      Write-Host "Invalid choice" -ForegroundColor Red
  }
}
