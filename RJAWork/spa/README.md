# SIMPLE Packet Associator (spa)
## Synopsis
**spa** is a tool for capturing packets and determining which processes those packets belong to.
## Usage
The main way to use spa is `spa <options>`
To view the process information in Wireshark, make sure to place the procinfo.lua script in your Wireshark plugins folder. It alternatively can be loaded at runtime with the command line option -X lua_script:procinfo.lua. To view process info as columns, simply right-click on the appropriate field under 'Process info' in the packet information tree and select 'Apply as Column'.
## Options
Option | Description
-------|-------------
-D		| Lists interfaces available to capture on and quits
-i [interface]	| Captures packets on specified interface. Can be used multiple times to specify multiple interfaces
-w [filename]	| Specify the file to write out to. Default file is "spa.pcapng"
## Requirements
spa requires tshark and editcap from Wireshark.
Since spa parses the /proc filesystem to associate inodes to processes, it generally must be run with root privileges.
## Known issues
The underlying use of tshark while running as root causes tshark to warn the user upon program startup. If you know that running tshark as root will be problematic, it may be possible to configure your system to allow spa to read the necessary files under /proc without full root access. This behavior is (so far) untested.