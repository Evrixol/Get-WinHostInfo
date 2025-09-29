# Basic function to type out eighty (80) dashes ("-") and then a carriage return and line-feed, this
# will act as a basic seperator for the different "Common Information Module" (CIM) class instance
# requests.
function Write-Breaker {
	for($i = 0; $i -LT 80; $i++) {
		Write-Host -NoNewLine "-"
	}
	Write-Host -NoNewLine "`r`n`r`n"
}

# Basic Input / Output System (BIOS)
Get-CimInstance -ClassName CIM_BIOSElement | Select-Object -Property BIOSVersion, Manufacturer,
	Version, InstallDate, ReleaseDate, BuildNumber

Write-Breaker

# Central Processing Unit (CPU)
Get-CimInstance -ClassName CIM_Processor | Select-Object -Property DeviceID, LoadPercentage, Name,
	Description, CurrentClockSpeed, Manufacturer, ThreadCount

Write-Breaker

# Physical Memory (RAM)
Get-CimInstance -ClassName Win32_PhysicalMemory | Select-Object -Property Caption, BankLabel,
	Capacity, Speed

Write-Breaker

# Storage Media (Storage Disks)
Get-CimInstance -ClassName CIM_LogicalDisk | Select-Object -Property VolumeName, DeviceID,
	FileSystem, Compressed, Size,	FreeSpace

Write-Breaker

# Graphics Processing Unit (GPU)
Get-CimInstance -ClassName CIM_VideoController | Select-Object -Property Name, DeviceID, AdapterRAM,
VideoProcessor,	DriverDate, DriverVersion, AdapterCompatibility, VideoModeDescription
