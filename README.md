# PIXEL-EMERGENCY-BACKUP

Have you ever broken your phone's screen? Or maybe the touch input stopped working, leaving you with a black screen? 
This toolkit is designed for exactly those scenarios. It provides a simple command-line menu to perform essential operations on your USB-connected Android device, allowing you to save your data or control it remotely.

⚠️ Note: This tool is intended **only for personal use on devices you own**. Do not use it on third-party devices without permission.

---

## 📌 Requirements

- Windows 10/11  
- [ADB / Platform Tools](https://developer.android.com/studio/releases/platform-tools) installed  
- [Scrcpy](https://github.com/Genymobile/scrcpy) for remote control via PC  
- USB Debugging enabled and already authorized for your PC  
- Pattern/PIN already set and phone unlocked at least once after reboot


## 🚀 How to Use
- Connect Your Phone: Connect your Android phone to your PC with a USB cable.
- Run the Script: Double-click the Pixel_Emergency_Toolkit.bat file.
- Choose an Option: A menu will appear. Enter the number corresponding to the desired operation and press Enter.
- Understanding "Soft Lock" vs. "Hard Lock"
 - HARD LOCK (after a reboot): If you've just rebooted your phone, its internal storage is encrypted. It requires your first unlock (PIN/pattern/password) to be decrypted.
  In this state, the Backup (Option 2) WILL FAIL, because ADB cannot access encrypted files.
  You can still use Scrcpy (Option 3) to see the lock screen and enter your code using your PC's mouse.
 - SOFT LOCK (screen off after use): If the phone has been unlocked at least once since the last reboot and then simply went to sleep.
  In this state, the storage is decrypted.
  All script options will work correctly, including file backups.
