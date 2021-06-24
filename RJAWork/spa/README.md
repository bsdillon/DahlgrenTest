# SIMPLE Packet Associator (spa)
## Synopsis
**spa** is a tool for capturing packets and determining which processes those packets belong to.
## Usage
The main way to use spa is `spa <options>`

To view the process information in Wireshark, make sure to place the procinfo.lua script in your Wireshark plugins folder. It alternatively can be loaded at runtime with the command line option `-X lua_script:procinfo.lua`. To view process info as columns, simply right-click on the appropriate field under 'Process info' in the packet information tree and select 'Apply as Column'.
## Options
Option | Description
-------|-------------
-D		| Lists interfaces available to capture on and quits
-i [interface]	| Captures packets on specified interface. Can be used multiple times to specify multiple interfaces
-w [filename]	| Specify the file to write out to. Default file is "spa.pcapng"
## Requirements
spa requires tshark and editcap from Wireshark.

Since spa parses the /proc filesystem to associate inodes to processes, it generally must be run with root privileges. If you do not run it with root privileges, it will only associate the processes that the running user owns.
## Known issues
The underlying use of tshark while running as root causes tshark to warn the user upon program startup. If you know that running tshark as root will be problematic, it may be possible to configure your system to allow spa to read the necessary files under /proc without full root access. This behavior is (so far) untested.
## Overview of How it Functions
There are two main components to the spa system: the main program and the dissector. 

The main program works by getting a pipe to an instance of tshark with specific fields. These fields are defined in `cap.c`. As tshark captures packets, the fields are put into the pipe in a comma separated list. The main program then reads this information and places it into a `frame` struct. Information from the struct is then used to identify the unique connection (for tcp and udp, this takes the form of source ip, source port, destination ip, and destination port). The unique connection information is used as a key to look up the inode that the connection is using. The table with the connection-to-inode mapping is filled by parsing files under `/proc/net/` that are specific to the protocol (eg `/proc/net/tcp`). Once the inode is identified, the inode is mapped to a pid and the pid is mapped to a process name. The inode-to-pid mapping is done by iterating through `/proc/<pid>/fd` and calling readlink() to see whether the process is using a socket (and what the inode of that socket is). The pid-to-process mapping is done by reading `/proc/<pid>/cmdline`. These mappings are stored in hash tables that are updated constantly when there are no packets coming in as well as once when the table has an initial miss for a frame. After a lookup, the process info is stored in the frame's procinfo field.

After the main capture is done, editcap is called in order to store each frame's procinfo string into the corresponding frame's frame.comment field in the captured pcapng file.

The dissector works by registering a protocol with Wireshark with an assigned postdissector. A postdissector runs after all the regular dissectors are run for a packet. The dissector reads the string stored in a packet's frame.comment field and extracts the process name and pid fields. This information is then displayed in the packet information tree in Wireshark. If the string is bad or no process information was found, the fields are both set to 'No info'.  
## Task List
- [x] Get pipe to tshark working
- [x] Get ipv4 tcp association working
- [x] Get ipv4 udp association working
- [x] Get ipv6 tcp association working
- [x] Get ipv6 udp association working
- [x] Get writing association to file working
- [x] Write dissector to display information in Wireshark
- [ ] Write tests to prove functionality (WIP)
- [ ] Get documentation done

TODO: Add more tasks