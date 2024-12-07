# Automatic Subtitle Translation Generation Tool

A streamlined batch script for automated subtitle generation and translation using OpenAI's Whisper model. This tool simplifies the process of creating accurate subtitle files (SRT) from video and audio files with support for multiple languages.

## Overview

This tool automates the process of generating subtitles from video and audio files using OpenAI's Whisper speech recognition model. It supports automatic language detection and specific language targeting, making it particularly useful for processing content in various languages.

The primary objective of AutoSubTranslation is to provide users with a seamless "plug and play" experience. Users simply place their video files in a designated folder and execute a batch file, which automatically processes the content and generates accurate SRT subtitle files in the corresponding languages.

## Installation

1. Download the script (`generate_subtitles.bat`) to your local machine

2. Install Python:
   - Download Python 3.9.9 from [python.org](https://www.python.org/downloads/release/python-399/)
   - During installation, ensure "Add Python to PATH" is checked
   - Complete the installation process

3. Install FFmpeg using Chocolatey (Recommended):
   
   First, install Chocolatey:

    See https://chocolatey.org/install for the latest instructions:

   - Open PowerShell as Administrator
   - Execute the following command:
   ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
   
   Then, install FFmpeg:
   ```powershell
   choco install ffmpeg
   ```

4. Install Git:
   - Download Git from [git-scm.com](https://git-scm.com/downloads)
   - Use default installation settings
   - Complete the installation process

The script will automatically handle the installation of OpenAI's Whisper model during first run.

## Usage

1. Place the script in the same directory as your video/audio files
2. Double-click `generate_subtitles.bat` to run the script
3. When prompted, you can:
   - Press Enter for automatic language detection
   - Enter a specific language code (e.g., 'ja' for Japanese, 'ko' for Korean)
4. The script will process all supported media files in the directory and generate corresponding SRT files

### Supported Language Codes

To view a complete list of supported languages and their codes, open your command prompt and type:
```bash
whisper --help
```

## Output

- SRT files are generated in the same directory as the source files
- Each subtitle file will have the same name as its corresponding video file
- Processing logs are displayed in the console window

## Troubleshooting

### Common Issues and Solutions

1. "Python is not installed"
   - Install Python 3.x from python.org
   - Ensure "Add Python to PATH" is selected during installation
   - Restart your computer after installation

2. "FFmpeg is not installed"
   - Download FFmpeg from ffmpeg.org
   - Add FFmpeg to system PATH
   - Restart the command prompt

3. "No CUDA GPU detected"
   - This is not an error; processing will continue using CPU
   - For faster processing, consider using a system with an NVIDIA GPU

4. "No compatible media files found"
   - Ensure media files are in the same directory as the script
   - Verify files have supported extensions (.mp4, .mp3, .wav, .mkv, .avi)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

This tool uses the following open-source components:
- [OpenAI Whisper](https://github.com/openai/whisper)
- [FFmpeg](https://ffmpeg.org)

## Support

For issues, feature requests, or contributions, please open an issue in the GitHub repository.