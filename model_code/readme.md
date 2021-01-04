
# Project Goals

The `model_code` project aims to build visual models representing code, messages, and other sources of data.

## High-level goals (vague)

 - Find or Build tools to create models from data
    - Very open-ended, data may be XML, JSON, a directory of code.
      Models are also open-ended, UML is a good start and finite state machines will work for some types of data.
 
 - Document usage of tools, types of data they can ingest, and types of models they can produce
    - Can the ingest + model creation be done without an operator (aka 100% automated)?

## Low-level goals (specific)

_also links to relevant tools/libraries under each specific goal_

 - Process message data and generate graphs showing message type and recipients over time
    - Wireshark has something similar called "Flow Graphs": https://www.youtube.com/watch?v=fJc-y9Zum-4 also https://www.youtube.com/watch?v=m4y9xeaOEjk
    - "Mscgen" - a tool to generate message sequence graphs: http://www.mcternan.me.uk/mscgen/
        - We may need to read data in in one format (csv, json, xml?) and output MSC source code, then call mscgen to produce the image outputs

 - Process directory of code to show relationships between classes
    - Looks like UML, but with more detail related to inner functionality
    - Generate a [composite structure diagram](https://www.google.com/search?q=composite+structure+diagram)
    - [stackoverflow question about using graphviz to generate diagram](https://stackoverflow.com/questions/51468720/graphviz-composite-structure-diagram)
    - [PlantUML component diagram](https://plantuml.com/component-diagram), which looks quite a bit like a composite structure diagram
    - [python lib to parse Java](https://github.com/c2nes/javalang)
    - [SO discussion on parsing c++](https://stackoverflow.com/questions/1444961/is-there-a-good-python-library-that-can-parse-c) (answer is don't do it - use [gcc-xml](http://gccxml.github.io/HTML/Index.html) to generate XML from c++, then parse the XML)
    - [zoo full of python parsing libs](https://wiki.python.org/moin/LanguageParsing) (no languages in particular, define your own grammar, etc)

# Project Structure

`./datasets/` - contains raw/original datasets we want to build graphs from

`./reports/` - contains text (`*.txt`) or markdown (`*.md`) reports about 3rd-party tools, libraries, and anything learned that looks useful. Please include author and tool name in reports.

`./tools/` - any tools/code written should go in sub-directories here. Please write down how the tool should be used and what dependencies it has.

Example tool documentation:
```
pcap_parser.py uses the Scapy library to parse network data from a .pcap and generates PlantUML sequence diagrams showing packets to/from hosts.
Usage: python pcap_parser.py /path/to/capture.pcap /path/to/output.puml

Then to generate a graph run:
    java -jar plantuml.jar /path/to/output.puml
which should generate output.png
```


# Misc. Tools/Docs/Resources

 - [List of python modeling libraries](https://github.com/grundic/awesome-python-models)
 - [Article about GUI modeling tools](https://www.softwaretestinghelp.com/data-modeling-tools/)
 - [Umbrello - open-source UML GUI](https://umbrello.kde.org/) [umbrello windows install link](https://download.kde.org/stable/umbrello/latest/win64/)
 - [Graphviz](https://www.graphviz.org/) also the [python wrapper](https://graphviz.readthedocs.io/en/stable/manual.html) - 
   a graphics drawing library that can connect nodes + render to png/svg/jpeg
 - [public pcap files](https://www.netresec.com/?page=PcapFiles). These contain network messages which may be viewed using wireshark.




