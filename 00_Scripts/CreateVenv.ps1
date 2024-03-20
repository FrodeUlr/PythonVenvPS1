param (
    [string]$pyver = "3.10"
)

$currentDir = Get-Location
Set-Location "G:\PythonVenv\01_Venv"

$directories = Get-ChildItem -Path G:\PythonVenv\01_Venv -Directory
while ($true) {
    $flagged = $false
    $venvName = Read-Host "Name of new virtual environment"
    foreach ($directory in $directories) {
        if ($directory.Name -eq $venvName) {
            Write-Host "Virtual environment '$venvName' already exists"
            $flagged = $true
        }
    }
    if ($flagged -eq $false) {
        try {
            Write-Host "Creating virtual environment '$venvName'"
            & python$pyver -m venv $venvName
            & .\$venvName\Scripts\activate.ps1
            python -m pip install --upgrade pip
            pip install neovim pyvim pylint pydantic jupyter jupyterthemes
            Write-Host "Virtual environment '$venvName' created"
        } catch {
            Write-Host "Error creating virtual environment '$venvName'"
        }
        finally {
            Write-Host "Exiting virtual environment creation script"
        }
        break
    }
}
Set-Location $currentDir
