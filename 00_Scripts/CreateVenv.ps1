param (
    [Parameter(Mandatory=$true)]
    [string]$name,
    [string]$version = "3.10"
)

$currentDir = Get-Location
$path = $env:PRIV_PYTHON_LOC
Set-Location $path

$directories = Get-ChildItem -Path $path -Directory
while ($true) {
    $flagged = $false
    $venvName = $name
    foreach ($directory in $directories) {
        if ($directory.Name -eq $venvName) {
            Write-Host "Virtual environment '$venvName' already exists"
            $flagged = $true
        }
    }
    if ($flagged -eq $false) {
        try {
            Write-Host "Creating virtual environment '$venvName' with Python $version"
            & python$version -m venv $venvName
            & .\$venvName\Scripts\activate.ps1
            python -m pip install --upgrade pip
            pip install neovim pyvim pylint pydantic jupyter jupyterthemes ruff-lsp
            Write-Host "Virtual environment '$venvName' created successfully"
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
