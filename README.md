# ULTIMATE Tweaks Pack for Windows 10/11

**One-stop PowerShell and manual tweak collection** to speed up, optimize, and clean Windows 10/11. Designed for lightweight laptops, low-end PCs, and users who want **fast, privacy-friendly Windows** without unnecessary bloat.

---

## 🚀 Features & Tweaks (Clickable Sections)

| Category | Tweak | Section |
|----------|-------|---------|
| **Privacy** | Disable telemetry and data collection | [Privacy](#privacy) |
| | Disable Cortana | [Privacy](#privacy) |
| | Disable ads, suggestions, and lock screen tips | [Privacy](#privacy) |
| **Performance** | Disable unnecessary services | [Performance](#performance) |
| | Speed up animations and UI delays | [Performance](#performance) |
| | Optimize startup apps | [Performance](#performance) |
| | Disable SysMain / Superfetch | [Performance](#performance) |
| **Bloat Removal** | Remove built-in UWP apps | [Bloat Removal](#bloat-removal) |
| | Disable OneDrive (optional) | [Bloat Removal](#bloat-removal) |
| **Maintenance** | Clean temp files and prefetch folder | [Maintenance](#maintenance) |
| | Defragment / Optimize SSD (manual) | [Maintenance](#maintenance) |
| | Clear Windows Update cache | [Maintenance](#maintenance) |
| **Updates** | Disable automatic Windows Updates | [Updates](#updates) |
| **Optional / Manual Tweaks** | Disable Windows tips and suggestions via Registry | [Manual Tweaks](#manual-tweaks) |
| | Disable Xbox / Game DVR / Gaming Overlay | [Manual Tweaks](#manual-tweaks) |
| | Disable startup telemetry tasks in Task Scheduler | [Manual Tweaks](#manual-tweaks) |
| | Disable Feedback Hub | [Manual Tweaks](#manual-tweaks) |
| | Set power plan to High Performance | [Manual Tweaks](#manual-tweaks) |

---

## 💻 Usage

1. Open **PowerShell as Administrator**  
2. Download the script or save as `TweaksPack.ps1`  
3. Run:  
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\TweaksPack.ps1

## 📝 Sections

### Privacy
- **Telemetry & Data Collection**: Disables Diagnostic Tracking service and telemetry registry keys  
- **Cortana**: Turn off Cortana to save RAM and reduce background activity  
- **Ads & Tips**: Disable Start menu suggestions, lock screen tips, and app ads

### Performance
- Disable unnecessary services (`XblGameSave`, `PrintNotify`, `Fax`, `MapsBroker`, etc.)  
- Speed up animations via `MenuShowDelay`, `WaitToKillAppTimeout`, `HungAppTimeout`  
- Disable Superfetch / SysMain for faster response on low-end hardware  
- Optional: disable unnecessary startup apps via Task Manager  

### Bloat Removal
- Remove built-in UWP apps: Xbox, Solitaire, 3D Viewer, Maps, etc.  
- Optional: Disable OneDrive completely if not needed  

### Maintenance
- Clean `%Temp%` and `C:\Windows\Prefetch`  
- Clear Windows Update cache for faster updates  
- Optional: Optimize / defrag SSD manually via Windows built-in tool  

### Updates
- Disable automatic updates for low-end laptops or offline usage  
- Optional: configure manual updates policy via Registry  

### Manual Tweaks
- Disable Feedback Hub via registry  
- Disable Xbox Game DVR / Overlay for gaming optimization  
- Disable scheduled telemetry / activity tasks in Task Scheduler  
- Set High Performance power plan  
- Optional: tweak Windows Explorer / taskbar animations, notifications, and search indexing for extra speed


## 🔗 References

- [Microsoft Docs: Windows Services](https://docs.microsoft.com/en-us/windows/win32/services/services)  
- [PowerShell Best Practices](https://docs.microsoft.com/en-us/powershell/scripting/overview)  
- [Windows Privacy & Telemetry Guide](https://www.ghacks.net/)  

## ⚡ Disclaimer

This script and tweak collection is provided **as-is**. The author is not responsible for any system damage, data loss, or misconfiguration. Use at your own risk.

## ⚠️ Important Notes

- Tested on **Windows 10 (2004–22H2) and Windows 11**  
- Backup important data before running scripts  
- Some tweaks **disable system services** (telemetry, OneDrive, Cortana)  
- Manual tweaks are optional but recommended for full optimization

