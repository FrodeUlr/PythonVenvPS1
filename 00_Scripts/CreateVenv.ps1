param (
    [Parameter(Mandatory=$true)]
    [string]$name,
    [string]$version = "3.10",
    [string]$clean = "false"
)

$currentDirTmp = Get-Location
$path = $env:PRIV_PYTHON_LOC


if ($null -eq $path -or -not (Test-Path -Path $path)) {
  Write-Host "Environment variable PRIV_PYTHON_LOC is not correctly set" -ForegroundColor Red
  exit 1
}
Set-Location $path

$directories = Get-ChildItem -Path $path -Directory
while ($true) {
    $flagged = $false
    $venvName = $name
    foreach ($directory in $directories) {
        if ($directory.Name -eq $venvName) {
            Write-Host "Virtual environment '$venvName' already exists" -ForegroundColor Yellow
            $flagged = $true
        }
    }
    if ($flagged -eq $false) {
        try {
            Write-Host "Creating virtual environment '$venvName' with Python $version" -ForegroundColor Cyan
            & uv venv $venvName --python $version
            & .\$venvName\Scripts\activate.ps1
            if ($clean -eq "false") {
                uv pip install neovim pyvim pylint pydantic jupyter jupyterthemes ruff-lsp
            }
            Write-Host "Virtual environment '$venvName' created successfully" -ForegroundColor Green
        } catch {
            Write-Host "Error creating virtual environment '$venvName'" -ForegroundColor Red
        }
        finally {
            Write-Host "Exiting virtual environment creation script" -ForegroundColor Cyan
        }
        break
    }
    break
}
Set-Location $currentDirTmp
