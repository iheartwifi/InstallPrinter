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
MIT License
Copyright (c) [2025] [HeyWan]

Permission is hereby granted, free of charge, to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit others to do so, subject to the following conditions:

The above copyright notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

