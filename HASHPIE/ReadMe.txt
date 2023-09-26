⚠️ Disclaimer
All scripts, files, and executables in this repository are provided "AS IS" without warranty of any kind. We expressly disclaim all liability for any damages or losses arising out of or in connection with the use of these scripts, files, and executables.

It is strongly recommended to test all items in a non-production, test environment before deploying them into production. Use at your own risk.

Please note you WILL need access to your Company or Organizations Microsoft Intune Admin Center. To continue past step 8.
--- --- --- --- --- --- --- --- --- ---
HOW TO USE: (Newbies Guide)
1. Download or move HASHPIE folder to the computers Downloads folder (Please make sure this is on the device you wish to wipe and/OR enroll into Autopilot)
2. Open the HASHPIE folder.
3. Right click Register.bat
4. Select "Run as Administrator"
5. Select "Yes" on the security pop up.
6. Wait for message to pop up.
6A. If it says to run as admin, please delete any other file made in the folder, and re-try from step 3.
6B. If you're running as administrator, and getting the manual code error, please try using the codes in "Manual Codes.txt" using An elevated (Terminal or Powershell ran as an Administrator".
7. Copy file given named the devices Serial Number, and ends in .csv
8. Transfer the file to the correct computer via email or flash drive.
8A. If you're comfortable with logging in to Microsoft Admin Center on the current device, you can do this as well.
9. On your work device, open up Intune, and head to Devices > Windows > Windows Enrollment > Devices.
9A: Direct link here: endpoint.microsoft.com/?ref=AdminCenter#view/Microsoft_Intune_Enrollment/AutopilotDevices.ReactView
10. Select "Import" on the top menu right above the search box on the "Windows Autopilot Devices" page.
11. Plug the flash drive in to your work device.
12. On The Autopilot page, click "Select a File" to the new "Add Autopilot devices" menu on the right-hand side.
13. Using the File Explorer Pane that pops up, navigate to your flash drive.
14. Select the file named the devices serial number ending in .csv
15. Select Okay on the File Explorer Pane. On the "Add Autopilot devices" menu, select "Import on the bottom.
16. Please wait until the import is successful.
17. Search for the device using the Serial number from the .csv name.
18. Check the box next to your newly added device.
19. Select Assign user, right above the search box.
20. Assign the user, then hit Select.
21. Hit save, and feel free to delete the "SerialNumber.csv" file from your flash drive to prepare it for its next use.
22. The device can now be setup by its new user.
22A. You can set this up yourself using the new assigned users email and password OR
22B. You can allow the new user to take this device with them and set it up on their own time.

You have completed every step, congratulations!

--- --- --- --- --- --- --- --- --- ---
WHAT DOES EACH LINE OF CODE DO?
- - - - - Register.bat
The "Tokens=2 delims==" section retrieves the Serial Number from the BIOS and store it in the 'serial' variable.

The "cd /d" section changes the current directory to the specified path and runs the PowerShell script 'Reg.ps1' with ExecutionPolicy set to Bypass.

The "Set Filepath=" section constructs the file path using the retrieved serial number.

The ":Filecheck" section is designed to check the files name and size. If the file size is 0kb, then it will show an error you need to run as admin. If file size is above 0kb and file name is correct, then success message is shown. Otherwise if the file is incorrectly named, then something went wrong and we recommend using the Manual commands located in "Manual Commands.txt"

- - - - - Reg.ps1
Set-Location -Path $PSScriptRoot ::: SetS the current location to the directory where the script is located. Please have the folder "HASHPIE" in downloads.

$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts" ::: This adds the specified directory to the system's Path environment variable for the duration of the PowerShell session.

$serialNumber = (Get-WmiObject -Query "SELECT * FROM Win32_BIOS").SerialNumber ::: Retrieves the Serial Number from the BIOS and stores it in the $serialNumber variable.

$outputFile = "$serialNumber.csv" ::: Constructs the name of the output file using the retrieved serial number.

Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force ::: Sets the execution policy for the current PowerShell process to RemoteSigned.

Install-Script -Name Get-WindowsAutopilotInfo -Force ::: Forces an Install of the Get-WindowsAutopilotInfo script from the PowerShell Gallery.

Get-WindowsAutopilotInfo -OutputFile $outputFile ::: Runs the installed Get-WindowsAutopilotInfo script and outputs the information to a CSV file named after the serial number.