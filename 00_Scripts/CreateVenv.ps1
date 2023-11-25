$currentDir = Get-Location
Set-Location "G:\PythonVenv\01_Venv"

$directories = Get-ChildItem -Path G:\PythonVenv\01_Venv -Directory
while ($true) {
    $flagged = $false
    $venvName = Read-Host "Name of new virtual environment"
    foreach ($directory in $directories) {
        if ($directory.Name -eq $venvName) {
            echo "Virtual environment '$venvName' already exists"
            $flagged = $true
        }
    }
    if ($flagged -eq $false) {
        echo "Creating virtual environment '$venvName'"
        & python -m venv $venvName
        & .\$venvName\Scripts\activate.ps1
        python -m pip install --upgrade pip
        pip install neovim pyvim pylint pydantic
        break
    }
}
Set-Location $currentDir
echo "Virtual environment '$venvName' created"
