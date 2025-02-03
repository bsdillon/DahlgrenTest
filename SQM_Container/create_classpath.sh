#!/bin/bash

# Dynamically add all subdirectories of /workspace/compiled_grammars to the CLASSPATH
CLASSPATH="."
echo "Listing directories in /workspace/compiled_grammars:"
ls -l /workspace/compiled_grammars/

# Loop through the directories and append them to CLASSPATH
for dir in /workspace/compiled_grammars/*; do
    if [ -d "$dir" ]; then
        echo "Adding $dir to CLASSPATH"
        CLASSPATH="$CLASSPATH:$dir"
    else
        echo "Skipping $dir (not a directory)"
    fi
done

# Ensure the current directory and ANTLR JAR are included
CLASSPATH="/workspace/compiled_grammars/antlr.jar:$CLASSPATH"

# Set the environment variable for future Docker layers
echo "CLASSPATH=$CLASSPATH" >> /etc/environment

# Also set it in the shell for the current session
export CLASSPATH

# Print final CLASSPATH for debugging
echo "Final CLASSPATH: $CLASSPATH"