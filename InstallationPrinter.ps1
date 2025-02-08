# Define the log file path
$logFile = "PrinterLogFile.txt" 

# Function to log messages
function Log-Message {
    param([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date) - $message"
}

# Define the printer's info
$printerName = "Imprimante ABC1234"
$printerIP = "" 
$printerDriver = "DriverA1"  

# Log the start of the script
Log-Message "Script started for printer installation."

# Try to find the printer's IP address dynamically (using a network scan or another method)
if ($printerIP -eq "") {
    $subnet = "192.168.1" 
    $startRange = 1
    $endRange = 254
    $foundPrinter = $null

    Log-Message "Searching for printer in the subnet $subnet."

    for ($i = $startRange; $i -le $endRange; $i++) {
        $ip = "$subnet.$i"
        
        try {
            # Ping to check if the IP is reachable
            $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet
            if ($ping) {
                $tcpCheck = Test-NetConnection -ComputerName $ip -Port 9100
                if ($tcpCheck.TcpTestSucceeded) {
                    $foundPrinter = $ip
                    Log-Message "Printer found at $foundPrinter."
                    break
                }
            }
        }
        catch {
            Log-Message "Error connecting to $ip: $_"
            continue
        }
    }

    # If printer is found, assign the dynamic IP
    if ($foundPrinter) {
        $printerIP = $foundPrinter
        Write-Host "Printer found at $printerIP"
    } else {
        Write-Host "Printer not found on the network."
        Log-Message "Printer not found on the network."
        exit 1
    }
}

# Log the printer installation process
try {
    # Add a new printer port with the discovered IP address
    Add-PrinterPort -Name "IP_$printerIP" -PrinterHostAddress $printerIP
    Log-Message "Added printer port for $printerIP."

    # Add the printer with the specified name and driver
    Add-Printer -Name $printerName -Port "IP_$printerIP" -DriverName $printerDriver
    Log-Message "Printer installation completed for $printerName at $printerIP."

    Write-Host "Printer installation completed."
}
catch {
    Log-Message "Error during printer installation: $_"
    Write-Host "Error during printer installation: $_"
    exit 1  # Exit the script if an error occurs during printer installation
}
