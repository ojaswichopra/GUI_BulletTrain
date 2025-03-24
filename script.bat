@REM @echo off
@REM REM Navigate to the Frontend directory
@REM cd Frontend || (echo Directory Frontend not found! && exit /b 1)

@REM REM Upgrade pip
@REM echo Upgrading pip...
@REM python -m pip install --upgrade pip

@REM REM Install requirements
@REM set REQUIREMENTS_PATH=requirements.txt
@REM if exist "%REQUIREMENTS_PATH%" (
@REM     echo Installing requirements from %REQUIREMENTS_PATH%...
@REM     python -m pip install -r "%REQUIREMENTS_PATH%"
@REM ) else (
@REM     echo Error: %REQUIREMENTS_PATH% does not exist!
@REM     exit /b 1
@REM )

@REM REM Run Streamlit app
@REM echo Starting Streamlit app...
@REM python -m streamlit run Landing.py --server.headless=false --server.enableXsrfProtection=false --server.enableCORS=false

@echo off
REM Navigate to the Frontend directory
cd Frontend || (echo Directory Frontend not found! && exit /b 1)

REM Check if virtual environment exists
if not exist "..\myenv" (
    echo Creating virtual environment...
    python -m venv ..\myenv
    echo Virtual environment created.
)

REM Activate the virtual environment
echo Activating virtual environment...
call ..\myenv\Scripts\activate

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements
set REQUIREMENTS_PATH=requirements.txt
if exist "%REQUIREMENTS_PATH%" (
    echo Installing requirements from %REQUIREMENTS_PATH%...
    python -m pip install -r "%REQUIREMENTS_PATH%"
) else (
    echo Error: %REQUIREMENTS_PATH% does not exist!
    exit /b 1
)

REM Run Streamlit app
echo Starting Streamlit app...
python -m streamlit run Landing.py --server.headless=false --server.enableXsrfProtection=false --server.enableCORS=false

REM Deactivate the virtual environment
echo Deactivating virtual environment...
deactivate
