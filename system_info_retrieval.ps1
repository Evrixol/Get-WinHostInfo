<#
	This Power-Shell script is part of a one file batch script that will retrieve basic information
	about a computer that it is executed upon. This script has been made with the intent to be run
	upon a system running Windows of major version 20H2 - 24H2 (That is, Windows 10 / 11).
	
	The information retreived will simply be written to a console window. If the script has been
	executed outside of a console window one will be opened for the purpose of executing the script,
	once the script has completed its runtime the console window will close automatically.
	
	In the event someone wishes to run this script without changing the systems base execution
	policy *and* print the output of this script to a file to be reviewed elsewhere or at a later
	time this PowerShell script should have shipped with a batch (.bat) file which which, when
	located in the same directory of this file with the name of this file being unchanged (it should
	be `system_info_retrieval.ps1` sans backticks) will- when executed- run this script file
	with a parameter telling the system to bypass the systems PowerShell script execution policy
	temporarily for this script file alone and only for the duration necessary for this shell file
	to run the one time. It shall then write the output of this script to a file located on the
	executing users Desktop (located at `%USERPROFILE%\Desktop`). It shall then read the output of
	the file into the console and pause for further input. Once further input is given the console
	will close or otherwise return to the command input prompt.

	The information gathered and put into the file is as follows:
		* Basic Input / Output System (BIOS)
			* BIOS Version
			* Manufacturer
			* Name
			* Install Date
			* Release Date
			* Build Number
		* Base Processor
			* Device Identity/Identifier
			* Percentage of Load
			* Processor Model
			* Processor Manufacture
			* Clock Speed
			* Physical Thread Count
		* Memory (RAM)
			* Caption
			* Bank Label / Number
			* Size (in MiB)
			* Clock Speed
		* Storage (Logical / Virtual Devices)
			* Volume Name
			* Drive Letter
			* Filesystem Format
			* Compression Status (Boolean)
			* Total Capacity (GiB)
			* Remaining Space (GiB)
			* Remaining Space (Percentage)
		* Graphics Processor
			* Name
			* Device Identity/Identifier
			* Video Memory Capacity (VRAM) (in Bytes)
			* Processor Name
			* DriverDate
			* DriverVersion
			* Adapter Compatibility Type
			* Adapter Properties
			
	!!!! DO NOTE !!!!
	
	This tool __DOES NOT__ require internet access and it does not gather or otherwise interact with
	or gather information on the networks, networking capabilities, or network interfaces of the
	system it is run on or any other.
#>

# Basic function to type out eighty (80) dashes ("-") and then a carriage return and line-feed, this
# will act as a basic seperator for the different "Common Information Module" (CIM) class instance
# requests.
function Write

# Basic Input / Output System (BIOS)
Get-CimInstance -ClassName CIM_BIOSElement | Select-Object -Property BIOSVersion, Manufacturer,
	Version, InstallDate, ReleaseDate, BuildNumber

Write-Output "`r`n"

# Central Processing Unit (CPU)
Get-CimInstance -ClassName CIM_Processor | Select-Object -Property DeviceID, LoadPercentage, Name,
	Description, CurrentClockSpeed, Manufacturer, ThreadCount

Write-Output "`r`n"

# Physical Memory (RAM)
Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object -Property Caption, BankLabel,
	Capacity, Speed

Write-Output "`r`n"

# Storage Media (Storage Disks)
Get-CimInstance -ClassName CIM_LogicalDisk | Select-Object -Property VolumeName, DeviceID,
	FileSystem, Compressed, Size,	FreeSpace

Write-Output "`r`n"

# Graphics Processing Unit (GPU)
Get-CimInstance -ClassName CIM_VideoController | Select-Object -Property Name, DeviceID, AdapterRAM,
VideoProcessor,	DriverDate, DriverVersion, AdapterCompatibility, VideoModeDescription
