# PythonVenv

## Requirements:

- [Astral UV](https://docs.astral.sh/uv/) installed globally
- [Powershell 7](https://github.com/PowerShell/powershell/releases) or PowerShell 5
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
    - If you would like to change the default packages, edit the `00_Scripts\CreateVenv.ps1` script.

    ```powershell
        if ($clean -eq "false") {
            uv pip install neovim pyvim pylint pydantic jupyter jupyterthemes ruff-lsp
        }
    ```

    ![image](./img/create.png)

- Run `00_Scripts\ActivateVenv.ps1` to activate a virtual environment:
    - `.\00_Scripts\ActivateVenv.ps1` will show a list of venvs and their python versions.
    - Enter the number of the venv you want to activate.

    ![image](./img/activate.png)

- Run `00_Scripts\DeleteVenv.ps1` to delete a virtual environment:
    - `.\00_Scripts\DeleteVenv.ps1` will show a list of venvs.
    - Enter the number of the venv you want to delete.

    ![image](./img/delete.png)

- Run `00_Scripts\ListVenvs.ps1` to list all virtual environments.

    ![image](./img/list.png)

## Tips:

To simplify the usage of the scrips, update your PowerShell profile with aliases to the scrips.
See the attached example profile in `00_Scripts\Microsoft.PowerShell_profile.ps1`.

Installing python packages should be done using UV, not pip:
  - `uv pip install <package>` will install the package in the active venv.
  - `pip` is not included in `uv venvs`, so it will not work.

  ![image](./img/uvpipinstall.png)
