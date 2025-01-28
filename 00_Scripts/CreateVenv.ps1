param (
    [Parameter(Mandatory=$true)]
    [string]$name,
    [string]$version = "3.10",
    [string]$clean = "false"
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
            & uv venv $venvName --python $version
            & .\$venvName\Scripts\activate.ps1
            if ($clean -eq "false") {
                uv pip install neovim pyvim pylint pydantic jupyter jupyterthemes ruff-lsp
            }
            Write-Host "Virtual environment '$venvName' created successfully"
        } catch {
            Write-Host "Error creating virtual environment '$venvName'"
        }
        finally {
            Write-Host "Exiting virtual environment creation script"
        }
        break
    }
    break
}
Set-Location $currentDir
