:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: LICENSING                                                                    :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Copyright 2020 Esri
::
:: Licensed under the Apache License, Version 2.0 (the "License"); You
:: may not use this file except in compliance with the License. You may
:: obtain a copy of the License at
::
:: http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
:: implied. See the License for the specific language governing
:: permissions and limitations under the License.
::
:: A copy of the license is available in the repository's
:: LICENSE file.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: VARIABLES                                                                    :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SETLOCAL
SET PROJECT_DIR=%cd%
SET PROJECT_NAME=d4_accessibility
SET SUPPORT_LIBRARY = d4_accessibility
SET ENV_NAME=d4_accessibility

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: COMMANDS                                                                     :
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Jump to command
GOTO %1

:: Perform data preprocessing steps contained in the make_data.py script.
:data
    ENDLOCAL & (
        CALL activate "%ENV_NAME%"
        CALL python src/make_data.py
        ECHO ^>^>^> Data processed.
    )
    EXIT /B

:: Perform data download steps contained in the get_data.py script.
:add_data
    ENDLOCAL & (
        CALL activate "%ENV_NAME%"
        CALL python src/get_data.py
        ECHO ^>^>^> Data pulled to ../data/raw
    )
    EXIT /B

:: Make documentation using Sphinx!
:docs
    ENDLOCAL & (
        CALL docsrc/make.bat github
    )
	EXIT /B

:: Build the local environment from the environment file
:env
    ENDLOCAL & (
        :: Ensure mamba installed in root env
        CALL conda install mamba -c conda-forge -y

        :: Create new environment from environment file
        CALL mamba env create -f environment.yml

        :: Install the local package in development (experimental) mode
        CALL python -m pip install -e .

        :: Activate the enironment so you can get to work
        CALL activate "%ENV_NAME%"

    )
    EXIT /B

:: Activate the environment
:env_activate
    ENDLOCAL & CALL activate "%ENV_NAME%"
    EXIT /B


:: Remove the environment
:env_remove
	ENDLOCAL & (
		CALL conda deactivate
		CALL conda env remove --name "%ENV_NAME%" -y
	)
	EXIT /B


:: Make the package for uploading
:build
    ENDLOCAL & (

        :: Build the pip package
        CALL python setup.py sdist

        :: Build conda package
        CALL conda build ./conda-recipe --output-folder ./conda-recipe/conda-build

    )
    EXIT /B

:build_upload
    ENDLOCAL & (

        :: Build the pip package
        CALL python setup.py sdist bdist_wheel
        CALL twine upload ./dist/*

        :: Build conda package
        CALL conda build ./conda-recipe --output-folder ./conda-recipe/conda-build
        CALL anaconda upload ./conda-recipe/conda-build/win-64/test_esri_project*.tar.bz2

    )
    EXIT /B

:: Run all tests in module
:test
	ENDLOCAL & (
		activate "%ENV_NAME%"
		pytest
	)
	EXIT /B

EXIT /B
