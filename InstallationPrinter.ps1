# Define the printer's info
$printerName = "Imprimante ABC1234"
$printerIP = "" 
$printerDriver = "DriverA1"  

# Try to find the printer's IP address dynamically (using a network scan or another method)
if ($printerIP -eq "") {
    $subnet = "192.168.1" 
    $startRange = 1
    $endRange = 254
    $foundPrinter = $null

    for ($i = $startRange; $i -le $endRange; $i++) {
        $ip = "$subnet.$i"
        
        try {
            # Ping to check if the IP is reachable
            $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet
            if ($ping) {
                # Check if printer port (commonly 9100) is open
                $tcpCheck = Test-NetConnection -ComputerName $ip -Port 9100
                if ($tcpCheck.TcpTestSucceeded) {
                    $foundPrinter = $ip
                    break
                }
            }
        }
        catch {
            Write-Host "Error connecting to $ip: $_"
            continue
        }
    }

    # If printer is found, assign the dynamic IP
    if ($foundPrinter) {
        $printerIP = $foundPrinter
        Write-Host "Printer found at $printerIP"
    } else {
        Write-Host "Printer not found on the network."
        exit 1  # Exit the script if the printer cannot be found
    }
}

# Proceed with adding the printer using the dynamic IP address
try {
    # Add a new printer port with the discovered IP address
    Add-PrinterPort -Name "IP_$printerIP" -PrinterHostAddress $printerIP

    # Add the printer with the specified name and driver
    Add-Printer -Name $printerName -Port "IP_$printerIP" -DriverName $printerDriver
    Write-Host "Printer installation completed."
}
catch {
    Write-Host "Error during printer installation: $_"
    exit 1  # Exit the script if an error occurs during printer installation
}
