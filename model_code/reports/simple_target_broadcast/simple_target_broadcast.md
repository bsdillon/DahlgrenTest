
# Simple Target Broadcast

Author: Jeffrey McAteer

The tool at `tools/simple_target_broadcast.py` reads a very simple `.csv` file containing
"Origin", "Recipient", and "Message" headers. An example of the data it processes
may be found at `datasets/simple_target_broadcast.csv`.

The tool reads messages and writes PlantUML to a temporary file.
It then uses `plantuml.jar` to generate a sequence diagram like the one below:

![sequence diagram](generated_seq_diagram.png)

The input data is formatted like:

```
Origin,Recipient,Message,
Ship A,Lead Ship,"Fire on 37.05 N, 73.82 W"
Lead Ship,Ship B,"Fire on 37.05 N, 73.82 W"
```

Example command-line invocation:

```bash
python tools/simple_target_broadcast.py datasets/simple_target_broadcast.csv /tmp/a.png
```

## Dependencies

 - [python](https://www.python.org/)
 - [java](https://jdk.java.net/15/)

