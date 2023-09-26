⚠️ Disclaimer
All scripts, files, and executables in this repository are provided "AS IS" without warranty of any kind. We expressly disclaim all liability for any damages or losses arising out of or in connection with the use of these scripts, files, and executables.

It is strongly recommended to test all items in a non-production, test environment before deploying them into production. Use at your own risk.

Please note you WILL need access to your Company or Organizations Microsoft Intune Admin Center. To continue past step 9.
--- --- --- --- --- --- --- --- --- ---
HOW TO USE: (Newbies Guide)
1. Plug a flash drive into your work device.
2. Drag files "Register.bat", "Get-WindowsAutopilotInfo.ps1" and "Reg.ps1" on to the empty flash drive.
3. Un-plug flash drive from work device.
4. Power up the new Windows device, in to it's "Out Of Box Experience" and/or after fully resetting the device.
5. Press keys "SHIFT" & "F10".
5A. if Command Prompt does not pop up, please press "FN" then re-try step 5.
6. Click on Command Prompt to ensure the window is the only thing selected. Otherwise, pressing keys can react with the setup for Windows.
7. Type (without the quotes): "D:\register"
8. Please wait until a message appears showing the devices Serial Number.
9. Close out of Command Prompt and shut down the new device in its "OOBE".
10. On your work device, open up Intune, and head to Devices > Windows > Windows Enrollment > Devices.
10A: Direct link here: endpoint.microsoft.com/?ref=AdminCenter#view/Microsoft_Intune_Enrollment/AutopilotDevices.ReactView
11. Select "Import" on the top menu right above the search box on the "Windows Autopilot Devices" page.
12. Plug the flash drive in to your work device.
13. On The Autopilot page, click "Select a File" to the new "Add Autopilot devices" menu on the right-hand side.
14. Using the File Explorer Pane that pops up, navigate to your flash drive.
15. Select the file named the devices serial number ending in .csv
16. Select Okay on the File Explorer Pane. On the "Add Autopilot devices" menu, select "Import on the bottom.
17. Please wait until the import is successful.
18. Search for the device using the Serial number from the .csv name.
19. Check the box next to your newly added device.
20. Select Assign user, right above the search box.
21. Assign the user, then hit Select.
22. Hit save, and feel free to delete the "SerialNumber.csv" file from your flash drive to prepare it for its next use.
23. The device can now be setup by its new user.
23A. You can set this up yourself using the new assigned users email and password OR
23B. You can allow the new user to take this device with them and set it up on their own time.

You have completed every step, congratulations!