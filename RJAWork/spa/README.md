# SIMPLE Packet Associator (spa)
## Synopsis
**spa** is a tool for capturing packets and determining which processes those packets belong to.
## Usage
The main way to use spa is `spa <options>`

To view the process information in Wireshark, make sure to place the procinfo.lua script in the Wireshark plugins folder. It alternatively can be loaded at runtime with the command line option `-X lua_script:procinfo.lua`. To view process info as columns, simply right-click on the appropriate field under 'Process info' in the packet information tree and select 'Apply as Column'.
## Options
Option | Description
-------|-------------
-c [count] | Limit capture to 'count' number of packets
-d [file] | Dump packet number/process info to 'file' after capture
-D		| Lists interfaces available to capture on and quits
-h | Print the help message
-i [interface]	| Captures packets on specified interface. Can be used multiple times to specify multiple interfaces
-s [limit] | Specify the number of packets to write process info to at a time. Default 500
-w [filename]	| Specify the file to write out to. Default file is "spa.pcapng"
## Requirements
spa requires tshark and editcap from Wireshark.

Since spa parses the /proc filesystem to associate inodes to processes, it generally must be run with root privileges. If you do not run it with root privileges, it will only associate the processes that the running user owns.
## Known issues
The requirement for running as root may cause tshark to generate a warning. It may be possible to use the Linux capabilities system to allow spa to have access to the necessary files, but this configuration is untested and would require tshark to be configured to capture without root access as well.

Only one instance of spa should be run on a machine at a time. Multiple instances will cause multiple instances of tshark/editcap to try to read and write a single file, which will not yield helpful information and may cause other issues. Even if different output files and interfaces are specified, the write-out process uses a single file under /tmp/ that should not be shared across instances. A workaround for this case is to capture on all interfaces then filter by frame.interface_name in Wireshark (packets can be exported to their own file after being filtered). The capture file can also be filtered by interface using tshark to “replay” the capture and filter with ‘–Y “frame.interface_name == [name]”’.

For captures with a large number of packets, especially with a relatively high bytes-per-packet, the final write-out process can take a while to finish (several minutes if the capture is over 100,000 packets or a few hundred megabytes). This is since editcap must run many times to write the information out in chunks, and it creates a new file for each chunk. Performance here can be sped up by increasing the write chunk size with the ‘-s’ option, but too large of a value may cause writing out to fail. NOTE: If writing out fails, or the program is terminated before the write-out process finishes, the file /tmp/spa.backup will contain a dump of the frame number and process info for all the packets captured (as if spa was run with ‘-d /tmp/spa.backup’). The file /tmp/spa.pcapng will contain the captured packets. The information in /tmp/spa.backup can be manually added to /tmp/spa.pcapng using editcap or some other tool to create the same output that spa would have had it not failed/been aborted.
## Overview of How it Functions
There are two main components to the spa system: the main program and the dissector. 

The main program works by getting a pipe to an instance of tshark with specific fields. These fields are defined in `cap.c`. As tshark captures packets, the fields are put into the pipe in a comma separated list. The main program then reads this information and places it into a `frame` struct. Information from the struct is then used to identify the unique connection (for tcp and udp, this takes the form of source ip, source port, destination ip, and destination port). The unique connection information is used as a key to look up the inode that the connection is using. The table with the connection-to-inode mapping is filled by parsing files under `/proc/net/` that are specific to the protocol (eg `/proc/net/tcp`). Once the inode is identified, the inode is mapped to a pid and the pid is mapped to a process name. The inode-to-pid mapping is done by iterating through `/proc/<pid>/fd` and calling readlink() to see whether the process is using a socket (and what the inode of that socket is). The pid-to-process mapping is done by reading `/proc/<pid>/cmdline`. These mappings are stored in hash tables that are updated constantly when there are no packets coming in as well as once when the table has an initial miss for a frame. After a lookup, the process info is stored in the frame's procinfo field.

After the main capture is done, editcap is called in order to store each frame's procinfo string into the corresponding frame's frame.comment field in the captured pcapng file. This is done in chunks due to argument number limitations to editcap.

The dissector works by registering a protocol with Wireshark with an assigned postdissector. A postdissector runs after all the regular dissectors are run for a packet. The dissector reads the string stored in a packet's frame.comment field and extracts the process name and pid fields. This information is then displayed in the packet information tree in Wireshark. If the string is bad or no process information was found, the fields are both set to 'No info'.  
## Task List
- [x] Get pipe to tshark working
- [x] Get ipv4 tcp association working
- [x] Get ipv4 udp association working
- [x] Get ipv6 tcp association working
- [x] Get ipv6 udp association working
- [x] Get writing association to file working
- [x] Write dissector to display information in Wireshark