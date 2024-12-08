@echo off
setlocal enabledelayedexpansion

echo Starting subtitle generation process...
echo Start time: %date% %time%
echo.

echo Checking system requirements...
echo.

REM Check Python installation
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python before running this script.
    echo Please see the github for more instructions.
    pause
    exit /b 1
)
echo Python installation found.

REM Check FFmpeg installation
ffmpeg -version > nul 2>&1
if %errorlevel% neq 0 (
    echo FFmpeg is not installed. Please install FFmpeg before running this script.
    pause
    exit /b 1
)
echo FFmpeg installation found.

REM Check Git installation
git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed. Please install Git before running this script.
    pause
    exit /b 1
)
echo Git installation found.

REM Check Whisper installation
pip show whisper > nul 2>&1
if %errorlevel% neq 0 (
    echo Whisper not found. Installing Whisper...
    echo This may take a few minutes...
    pip install git+https://github.com/openai/whisper.git
    if !errorlevel! neq 0 (
        echo Failed to install Whisper. Please check your internet connection and try again.
        pause
        exit /b 1
    )
    echo Whisper installed successfully.
) else (
    echo Whisper installation found.
)

REM Check for CUDA GPU
nvidia-smi >nul 2>&1
if %errorlevel% equ 0 (
    echo CUDA GPU detected - Processing will utilize GPU acceleration
) else (
    echo No CUDA GPU detected - Processing will run on CPU
    echo Note: Processing may be slower without GPU acceleration
)

echo.
echo All system requirements met.
echo.

REM Input Validation - Check for media files
dir /b *.mp4 *.mp3 *.wav *.mkv *.avi >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: No compatible media files found in current directory.
    echo Please ensure media files are in the same directory as this script.
    pause
    exit /b 1
)

REM Language selection prompt
echo Enter target language for translation, or press Enter for automatic detection
echo For supported languages, please visit the Github repository.
set "LANG=none"
set /p "LANG="

echo.
echo Processing video files...
echo.

set "processed_count=0"
set "error_count=0"

REM Process files based on language input
for %%f in ("*.mp4" "*.mp3" "*.wav" "*.mkv" "*.avi") do (
    echo.
    echo [%time%] Processing: %%f
    echo [%time%] Executing command:
    if "!LANG!"=="none" (
        echo whisper "%%f" --model large --task translate --output_format srt --logprob_threshold -0.5 --no_speech_threshold 0.5
        whisper "%%f" --model large --task translate --output_format srt --logprob_threshold -0.5 --no_speech_threshold 0.5
    ) else (
        echo whisper "%%f" --model large --task translate --language !LANG! --output_format srt --logprob_threshold -0.5 --no_speech_threshold 0.5
        whisper "%%f" --model large --task translate --language !LANG! --output_format srt --logprob_threshold -0.5 --no_speech_threshold 0.5
    )
   
    if !errorlevel! neq 0 (
        echo [%time%] Error processing "%%f". Continuing with next file...
        set /a "error_count+=1"
    ) else (
        echo [%time%] Successfully processed: %%f
        set /a "processed_count+=1"
    )
)

echo.
echo Processing complete.
echo End time: %date% %time%
echo Total files processed successfully: !processed_count!
if !error_count! gtr 0 (
    echo Files with errors: !error_count!
)
echo.
pause