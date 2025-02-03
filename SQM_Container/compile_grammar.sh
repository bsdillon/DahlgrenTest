#!/bin/bash

# Directories
GRAMMAR_DIR="/workspace/grammars"
OUTPUT_DIR="/workspace/compiled_grammars"
ANTLR_JAR="/workspace/grammars/antlr.jar"

echo "Starting grammar compilation..."

# Find all unique language prefixes based on file names ending with Lexer.g4
LANGUAGES=$(find "$GRAMMAR_DIR" -name '*Lexer.g4' | sed 's/.*\/\(.*\)Lexer\.g4/\1/')

# Compile each language pair
for LANGUAGE in $LANGUAGES; do
  if [ -d "$OUTPUT_DIR/$LANGUAGE" ]; then
    echo "Skipping $LANGUAGE as /compiled_grammar/$LANGUAGE already exists."
    continue
  fi
  echo "Compiling grammar for language: $LANGUAGE"
  
  # Check if both Lexer and Parser files exist
  LEXER_FILE="$GRAMMAR_DIR/${LANGUAGE}Lexer.g4"
  PARSER_FILE="$GRAMMAR_DIR/${LANGUAGE}Parser.g4"
  
  if [[ -f "$LEXER_FILE" && -f "$PARSER_FILE" ]]; then
    # Run ANTLR tool for the given language
    java -Xint -cp "$ANTLR_JAR" org.antlr.v4.Tool -o "$OUTPUT_DIR/$LANGUAGE" "$LEXER_FILE" "$PARSER_FILE" 

    # # Wait for the ANTLR process to finish
    # wait $TOOL_PID
    # TOOL_PID=$!

    # echo "javac -cp $ANTLR_JAR $OUTPUT_DIR/$LANGUAGE/*.java"
    # ls "$OUTPUT_DIR/$LANGUAGE/*.java"

    # Use inotifywait to watch for the creation of at least 4 .java files in the directory
    count=0
    while [ $count -lt 4 ]; do
      # Wait for a .java file to be created in the directory
      inotifywait -q -e create "$OUTPUT_DIR/$LANGUAGE"
      
      # Increment the count of .java files
      count=$(ls "$OUTPUT_DIR/$LANGUAGE"/*.java 2>/dev/null | wc -l)
      
      echo "Waiting for 4 ANTLR-generated Java files, currently found: $count"
    done

    # Once 4 Java files are found, run javac to compile them
    echo "Found all ANTLR-generated Java files. Compiling..."


    cd $OUTPUT_DIR/$LANGUAGE  
    javac -cp "$ANTLR_JAR" *.java
    cd /workspace

    # sleep 10
    # echo "javac -cp $ANTLR_JAR $OUTPUT_DIR/$LANGUAGE/*.java"
    # ls "$OUTPUT_DIR/$LANGUAGE/*.java"
    # ls -R $OUTPUT_DIR

    # echo "label 1"
    # javac -cp "$ANTLR_JAR" "$OUTPUT_DIR/$LANGUAGE/*.*"
    # echo "label 2"
    # javac -cp "$ANTLR_JAR" "$OUTPUT_DIR/$LANGUAGE/Java8Lexer.java"
    # echo "label 3"

    # Find all .java files in the specified directory
    # java_files=$(find "$OUTPUT_DIR/$LANGUAGE" -name "*.java")

    # # Check if any .java files were found
    # if [ -z "$java_files" ]; then
    #     echo "No .java files found to compile."
    #     exit 1
    # else
    #     # Run javac with all .java files as arguments
    #     echo "Compiling Java files..."
    #     echo "javac -cp $ANTLR_JAR $java_files"
    #     javac -cp "$ANTLR_JAR" $java_files
    # fi

    if [[ $? -eq 0 ]]; then
      echo "Successfully compiled grammar for $LANGUAGE"
    else
      echo "Error compiling grammar for $LANGUAGE"
    fi
  else
    echo "Missing Lexer or Parser file for language: $LANGUAGE"
  fi
done

echo "Grammar compilation completed. Compiled files are in $OUTPUT_DIR"