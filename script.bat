@echo off
REM Navigate to the Frontend directory
cd Frontend || (echo Directory Frontend not found! && exit /b 1)

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