Set-Location -Path $PSScriptRoot
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
$serialNumber = (Get-WmiObject -Query "SELECT * FROM Win32_BIOS").SerialNumber
$outputFile = "$serialNumber.csv"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
Install-Script -Name Get-WindowsAutopilotInfo -Force
Get-WindowsAutopilotInfo -OutputFile $outputFile