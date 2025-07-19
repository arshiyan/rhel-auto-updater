# 🛡️ RHEL Auto-Updater
### [English](#english) | [فارسی](#-farsi)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/Language-Shell_Script-green.svg)](./setup_auto_updates.sh)
[![Compatibility](https://img.shields.io/badge/Compatibility-RHEL_8+,%20AlmaLinux_8+,%20Rocky_8+-red.svg)](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux)A simple, one-command shell script to enable automatic security updates on RHEL-based Linux distributions like **AlmaLinux**, **Rocky Linux**, and **CentOS Stream**. Keep your server secure without manual intervention!

Created by [**Mohammad Javad Arshiyan**](https://github.com/arshiyan).

---

## <a name="english"></a>🇬🇧 English

### ✨ Features
*   **One-Command Setup**: Run a single command to get everything set up.
*   **Security-First**: Configures the system to only install critical **security** updates automatically, minimizing the risk of breaking changes.
*   **Intelligent & Safe**: Uses the official `dnf-automatic` tool and a `systemd` timer, which is the standard and recommended way.
*   **Interactive**: Asks for confirmation before making any changes to your system.
*   **Reversible**: Includes clear instructions on how to disable and remove it.

### ⚙️ How to Use

The quickest way is to run the script directly using `curl` without cloning the repository.

**One-Liner Command:**
```bash
curl -sL https://raw.githubusercontent.com/arshiyan/rhel-auto-updater/main/setup_auto_updates.sh | sudo bash
```

### 🔧 Manual Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/arshiyan/rhel-auto-updater.git
   ```
2. Navigate into the directory:
   ```bash
   cd rhel-auto-updater
   ```
3. Make the script executable:
   ```bash
   chmod +x setup_auto_updates.sh
   ```4. Run the script with sudo:
   ```bash
   sudo ./setup_auto_updates.sh   ```

### 🧐 How to Verify
To check if the automatic update timer is active, run:
```bash
systemctl status dnf-automatic.timer
```
You should see that the timer is `active (waiting)`.

### 🗑️ How to Uninstall
If you wish to disable automatic updates:
1. Disable and stop the timer:
   ```bash
   sudo systemctl disable --now dnf-automatic.timer
   ```
2. (Optional) Remove the package:
   ```bash
   sudo dnf remove -y dnf-automatic
   ```
---

## <a name="-farsi"></a>🇮🇷 فارسی

### ✨ ویژگی‌ها*   **نصب با یک دستور**: تنها با اجرای یک دستور، همه چیز را راه‌اندازی کنید.
*   **اولویت با امنیت**: سیستم را طوری پیکربندی می‌کند که فقط آپدیت‌های حیاتی **امنیتی** به صورت خودکار نصب شوند. این کار ریسک اختلال در سرویس‌ها را به حداقل می‌رساند.
*   **هوشمند و استاندارد**: از ابزار رسمی `dnf-automatic` و تایمر `systemd` استفاده می‌کند که روش استاندارد و پیشنهادی برای این کار است.
*   **تعاملی**: قبل از اعمال هرگونه تغییر روی سیستم، از شما تأییدیه می‌گیرد.
*   **قابل بازگشت**: شامل دستورالعمل‌های واضح برای غیرفعال‌سازی و حذف کامل است.

### ⚙️ نحوه استفاده
ساده‌ترین راه، اجرای مستقیم اسکریپت با استفاده از `curl` بدون نیاز به دانلود کل پروژه است.

**دستور تک-خطی:**
```bash
curl -sL https://raw.githubusercontent.com/arshiyan/rhel-auto-updater/main/setup_auto_updates.sh | sudo bash
```

### 🔧 نصب دستی
۱. پروژه را کلون (دانلود) کنید:   ```bash
   git clone https://github.com/arshiyan/rhel-auto-updater.git
   ```
۲. وارد پوشه پروژه شوید:
   ```bash
   cd rhel-auto-updater
   ```
۳. به اسکریپت دسترسی اجرایی بدهید:
   ```bash
   chmod +x setup_auto_updates.sh
   ```
۴. اسکریپت را با دسترسی sudo اجرا کنید:
   ```bash
   sudo ./setup_auto_updates.sh
   ```

### 🧐 نحوه بررسی وضعیت
برای اینکه ببینید آیا تایمر آپدیت خودکار فعال است، دستور زیر را اجرا کنید:
```bash
systemctl status dnf-automatic.timer
```
در خروجی باید ببینید که تایمر `active (waiting)` است.

### 🗑️ نحوه حذف
اگر می‌خواهید آپدیت خودکار را غیرفعال کنید:
۱. تایمر را غیرفعال و متوقف کنید:
   ```bash
   sudo systemctl disable --now dnf-automatic.timer
   ```
۲. (اختیاری) بسته را حذف کنید:
   ```bash
   sudo dnf remove -y dnf-automatic
   ```
