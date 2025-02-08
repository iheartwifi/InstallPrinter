# InstallPrinter
This project helps automate the installation of printers using PowerShell. It is designed to simplify the printer installation process by specifying the printer's IP address or dynamically (DHCP). Also, it supports a track logging installation progress.

# Features
- Automates printer installation via PWSH.
- Supports static and dynamic IP address configurations.
- Tracks installation process for troubleshooting and auditing.

# Prerequistes
- PowerShell
- Admin privilege
- Network access
- Visual Studio Code

# Script Configurations
- $printName
- $printerIP
- $printerDriver

# Execution Instructions
- Allow execution: Set-ExecutionPolicy -Scope Process -ExecutionPolicy ByPass
- Run the script (as admin): .\InstallationPrinter.ps1

# License
This project is licensed under the MIT License. Copyright (c) 2025 [HeyWan].