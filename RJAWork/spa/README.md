# SIMPLE Packet Associator (spa)
## Synopsis
**spa** is a tool for capturing packets and determining which process a packet belongs to.
## Usage
The main way to use spa is 'spa <options>'
## Options
	Option | Description
	-D		| Lists interfaces available to capture on and quits
	-i [interface]	| Captures packets on specified interface. Can be used multiple times to specify multiple interfaces
	-w [filename]	| Specify the file to write out to. Default file is "spa.pcapng"