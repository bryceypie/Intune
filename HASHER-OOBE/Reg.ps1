Set-Location -Path $PSScriptRoot
$serialNumber = (Get-WmiObject -Query "SELECT * FROM Win32_BIOS").SerialNumber
$outputFile = "$serialNumber.csv"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
.\Get-WindowsAutopilotInfo -OutputFile $outputFile