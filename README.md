# Automatic Subtitle Translation Generation Tool

A streamlined batch script for automated subtitle generation and translation using OpenAI's Whisper model. This tool simplifies the process of creating accurate subtitle files (SRT) from video and audio files with support for multiple languages.

## Overview

This tool automates the process of generating subtitles from video and audio files using OpenAI's Whisper speech recognition model. It supports automatic language detection and specific language targeting.

The primary objective of AutoSubTranslation is to provide users with a seamless "plug and play" experience. Users simply place their video files in a designated folder and execute a batch file, which automatically processes the content and generates accurate SRT subtitle files in the corresponding languages.

## Installation

1. Download the script (`generate_subtitles.bat`) to your local machine

2. Install Python:
   - Download Python 3.9.9 from [python.org](https://www.python.org/downloads/release/python-399/)
   - During installation, ensure "Add Python to PATH" is checked
   - Complete the installation process

3. Install FFmpeg using Chocolatey (Recommended):
   
   A. Install Chocolatey first:
   - Open PowerShell as Administrator
   - Visit https://chocolatey.org/install for the latest instructions
   - Copy and execute the installation command on the website. You should see something like 
   ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

   B. Then install FFmpeg:
   Restart your computer and run    
   ```powershell
   choco install ffmpeg
   ```

4. Install Git:
   - Download Git from [git-scm.com](https://git-scm.com/downloads)
   - Use default installation settings
   - Complete the installation process

The script will automatically handle the installation of OpenAI's Whisper model during first run.

## Usage

Please note that while this tool can run on systems with only CPU processing, 
a CUDA-enabled NVIDIA GPU is recommended for faster performance.

1. Place the script in the same directory as your video/audio files
2. Double-click `generate_subtitles.bat` to run the script
3. When prompted, you can:
   - Press Enter for automatic language detection
   - Enter a specific language code (e.g., 'ja' for Japanese, 'ko' for Korean) (See below for a detailed list)
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


## Appendix: Supported Languages

Whisper supports the following languages and their codes. You can use either the language code or the full name when prompted:

```
{
    af, am, ar, as, az, ba, be, bg, bn, bo, br, bs, ca, cs, cy, da, de, el, 
    en, es, et, eu, fa, fi, fo, fr, gl, gu, ha, haw, he, hi, hr, ht, hu, hy,
    id, is, it, ja, jw, ka, kk, km, kn, ko, la, lb, ln, lo, lt, lv, mg, mi,
    mk, ml, mn, mr, ms, mt, my, ne, nl, nn, no, oc, pa, pl, ps, pt, ro, ru,
    sa, sd, si, sk, sl, sn, so, sq, sr, su, sv, sw, ta, te, tg, th, tk, tl,
    tr, tt, uk, ur, uz, vi, yi, yo, yue, zh,
    
    Afrikaans, Albanian, Amharic, Arabic, Armenian, Assamese, Azerbaijani,
    Bashkir, Basque, Belarusian, Bengali, Bosnian, Breton, Bulgarian, Burmese,
    Cantonese, Castilian, Catalan, Chinese, Croatian, Czech, Danish, Dutch,
    English, Estonian, Faroese, Finnish, Flemish, French, Galician, Georgian,
    German, Greek, Gujarati, Haitian, Haitian Creole, Hausa, Hawaiian, Hebrew,
    Hindi, Hungarian, Icelandic, Indonesian, Italian, Japanese, Javanese,
    Kannada, Kazakh, Khmer, Korean, Lao, Latin, Latvian, Letzeburgesch,
    Lingala, Lithuanian, Luxembourgish, Macedonian, Malagasy, Malay, Malayalam,
    Maltese, Mandarin, Maori, Marathi, Moldavian, Moldovan, Mongolian, Myanmar,
    Nepali, Norwegian, Nynorsk, Occitan, Panjabi, Pashto, Persian, Polish,
    Portuguese, Punjabi, Pushto, Romanian, Russian, Sanskrit, Serbian, Shona,
    Sindhi, Sinhala, Sinhalese, Slovak, Slovenian, Somali, Spanish, Sundanese,
    Swahili, Swedish, Tagalog, Tajik, Tamil, Tatar, Telugu, Thai, Tibetan,
    Turkish, Turkmen, Ukrainian, Urdu, Uzbek, Valencian, Vietnamese, Welsh,
    Yiddish, Yoruba
}
```


## Future Work

### Performance Documentation
- Todo
### Usage Examples
- Todo
## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

This tool uses the following open-source components:
- [OpenAI Whisper](https://github.com/openai/whisper)
- [FFmpeg](https://www.ffmpeg.org/)

## Support

For issues, feature requests, or contributions, please open an issue in the GitHub repository.