# Get-WinHostInfo

## About

The PowerShell script and the batch file located within this repository were
specifically made for all intents and purposes to be run by a largely
technologically uneducated (or perhaps even "incompetent") user so that in the
event a technician was attempting to determine basic system facts about an
actively in-use Windows OS host, they were not required to have physical or
remote access or otherwise some form of management or monitoring tool upon the 
host which they were attempting to determine the specifications of.

This Power-Shell script is one of two very simplistic scripts that will retrieve
basic information about a computer that it is executed upon. This script has
been made with the intent to be run upon a system running Windows of major
version 20H2 - 24H2 (That is, Windows for Desktop, 10 / 11).

## Functions and Behavior

In the event the PowerShell script is executed independently upon a host the
information retreived will simply be written to standard output- presumably a
console. If the script has been executed outside of a dedicated command line or
console window one will be opened for the purpose of executing the script, and
once the script has completed its runtime the console window will close
automatically.

In the event someone wishes to run this script without changing the systems base
execution policy *and* print the output of this script to a file to be reviewed
elsewhere or at a later time this PowerShell script should have shipped with a
batch (.bat) file which which, when located in the same directory of this file
with the name of this file being unchanged (it should be simply titled
`system_info_retrieval.ps1`) will- when executed- run this script file by
passing the PowerShell scripts file path to the command line invoked PowerShell
executable with a parameter telling the system to bypass the systems PowerShell
script execution policy temporarily for this script file alone and only for the
duration necessary for this file to run. It shall then write the output of said
script to a file located on the executing users Desktop (located at
`%USERPROFILE%\Desktop`). It shall then read the output of the new file into the
console and pause for further input. Once further input is given the console
window will close or otherwise return to the command input prompt.

The information gathered and put into the output file located at :
`%USERPROFILE%\Desktop\system_info_retrieval--output.txt`
is as follows:

### Important Note(s)

#### On the Network Capabilities of this Utility
These scripts __DO NOT__ require, utilize, monitor, or determine the networking
capabilities, network adapters/interfaces, or networks of any host it is run
upon as of its current iteration published on (ISO-8601 formatted UTC date
`2025-09-29`).

#### The Information This Utility *Does* Retrieve

All information this utility retrieves is agnostic of any network and is only
about information of the executing host.

- Basic Input Output System (BIOS) [CIM_BIOSElement]
	- Name
	- Caption
	- Description
	- Manufacturer
	- BIOS Complete Version
	- BIOS Major Version Number
	- BIOS Minor Version Number
	- BIOS Firmware Release Date
	- BIOS Firmware Flash Date
	- SMBIOS Presence Boolean
	- SMBIOS Complete Version
	- SMBIOS Major Version Number
	- SMBIOS Minor version Number
	- Creation Class Name
- Processor (CPU) [CIM_Processor)
	- Device ID
	- Role
	- Name (CPU manufacturer & model.)
	- Manufacturer
	- Physical Core Count - Total
	- Physical Core Count - Enabled
	- Logical Core/Processor Count
	- LoadPercentage
	- DataWidth
	- AddressWidth
	- CurrentClockSpeed
	- Caption
	- Description
	- Status Number
	- Status Information
	- Availability
	- Creation Class Name
- Cache Memory (Cache) [CIM_Memory]
	- Device ID
	- Name
	- Caption
	- Description
	- Purpose (Type)
	- Status Number
	- Status Information
	- Availability
	- Block Size
	- Installed Size
	- Number of Blocks
	- Max Cache Size
	- Creation Class Name
- Physical Memory (RAM) [CIM_PhysicalMemory]
	- Bank Label
	- Tag
	- Name
	- Caption
	- Description
	- Manufacturer
	- Powered On
	- Status
	- Device Locator
	- Form Factor
	- Speed
	- Capacity
	- Data Width
	- Model
	- Part Number
	- Serial Number
	- Stock Keeping Unit (SKU)
	- Creation Class Name
- Storage Volumes (Logical Volumes / Disk Partitions) [CIM_StorageVolume]
	- Device ID
	- Name
	- Caption
	- Description
	- SerialNumber
	- Status
	- Status Information
	- Availability
	- Access
	- Purpose
	- IndexEnabled
	- File System Format
	- BlockSize
	- Number of Blocks
	- Capacity
	- Free Space
	- Drive Letter
	- System Volume
	- Page File Presence
	- Quotas Enabled
	- Incomplete Quota Count
	- Rebuilding Quota Count
	- Creation Class Name
- Graphics Processor (Graphics Processing Unit) [CIM_VideoController]
	- Device ID
	- Name
	- Caption
	- Description
	- Adapter Compatibility
	- Video Processor Name
	- Adapter Memory Quantity
	- Status
	- Statusinfo
	- Availability
	- Driver Release Date
	- Driver Version
	- Creation Class Name

