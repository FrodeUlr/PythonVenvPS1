$currentDir = Get-Location
Set-Location "D:\00_Privat_Git\PythonVenvPS1\01_Venv"
$directories = Get-ChildItem -Path D:\00_Privat_Git\PythonVenvPS1\01_Venv -Directory

while ($true) {
    $flagged = $false
    if($args.length -eq 0)
    {
        $venvName = Read-Host "Name of new virtual environment"
    }
    else
    {
        $venvName = $args[0]
    }
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
        pip install neovim pyvim pylint pydantic pytest
        break
    }
}
Set-Location $currentDir
echo "Virtual environment '$venvName' created"
Set-Location "D:\"
