# yt-dlp Auto Updater

A lightweight Bash script that automatically checks for the latest version of [yt-dlp](https://github.com/yt-dlp/yt-dlp) from GitHub and updates your local installation in `/usr/local/bin`.

---

## ✨ Features

- 🔍 Fetches the latest release from the GitHub API  
- ⚙️ Compares installed and latest versions  
- ⬇️ Downloads the newest binary if an update is available  
- 🔐 Installs securely using `pkexec`  
- 🌈 Color-coded terminal output for readability  
- 🧹 Automatically cleans up temporary files  

---

## 📦 Requirements

- Linux or macOS with Bash  
- `curl`  
- `pkexec` (for root privileges)  
- Internet connection  

---

## 🚀 Installation

1. Download the script:
   ```bash
   curl -O https://raw.githubusercontent.com/Abiddarris/yt-dlp-Auto-Updater/refs/heads/master/yt-dlp-updater.sh
   ```
2. Make it executable:
   ```bash
   chmod +x yt-dlp-updater.sh
   ```
3. Run the script:
   ```bash
   ./yt-dlp-updater.sh
   ```
> You will be prompted by **pkexec** to authorize the installation.
---

## 🧠 How It Works

1. The script queries the GitHub API for the latest yt-dlp tag (`tag_name`).
2. It checks if yt-dlp is installed and compares version numbers.
3. If a newer version exists, it downloads it to `/tmp/yt-dlp-latest`.
4. It installs the new binary into `/usr/local/bin/yt-dlp` with `pkexec`.
5. The temporary file is deleted once installation succeeds.

---

## 🧩 Example Output

```bash
[INFO] Checking latest yt-dlp version from GitHub...
[INFO] Latest yt-dlp version: 2025.10.09
[INFO] Installed yt-dlp version: 2025.04.03
[INFO] New version available. Downloading...
[SUCCESS] yt-dlp updated to 2025.10.09
```

---

## ⚠️ Notes

* This script assumes your yt-dlp is installed in `/usr/local/bin/yt-dlp`.
  You can change that path inside the script if needed.
* It requires `pkexec` (from `policykit-1`) to perform system-level copy operations.

---

## 📝 License

This project is released under the [Apache 2.0 License](LICENSE).

---
