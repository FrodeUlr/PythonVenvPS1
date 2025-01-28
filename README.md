# PythonVenv

## Requirements:

- [Astral UV](https://docs.astral.sh/uv/) installed globally
- [Powershell 7](https://github.com/PowerShell/powershell/releases)
- Environment variables:
    - `PRIV_PYTHON_SCRIPTS` = Path to the folder containing the scripts (`00_Scripts`)
    - `PRIV_PYTHON_VENV` = Path to the folder containing the virtual environments (`00_Venvs`, or any other place)

## Usage:

- Run `00_Scripts\CreateVenv.ps1` to create a new virtual environment:
    - `.\00_Scripts\CreateVenv.ps1 -Name "MyVenv" -PythonVersion "3.9"`
    - If no `PythonVersion` is provided, the script will default to `3.10`
    - The script will by default install these packages:
        - `neovim`
        - `pyvim`
        - `pylint`
        - `pydantic`
        - `jupyter`
        - `jupyterthemes`
        - `ruff-lsp`
    - If `--clean` is provided, no default packaged will be installed.
- Run `00_Scripts\ActivateVenv.ps1` to activate a virtual environment:
    - `.\00_Scripts\ActivateVenv.ps1` will show a list of venvs and their python versions.
    - Enter the number of the venv you want to activate.
- Run `00_Scripts\DeleteVenv.ps1` to delete a virtual environment:
    - `.\00_Scripts\DeleteVenv.ps1` will show a list of venvs.
    - Enter the number of the venv you want to delete.
- Run `00_Scripts\ListVenvs.ps1` to list all virtual environments.
