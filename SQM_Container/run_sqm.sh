#!/bin/bash

trigger_bell() {
    aplay /workspace/bell.mp3
}

# Get the classpath
export CLASSPATH=$(grep -E '^CLASSPATH=' /etc/environment | cut -d'=' -f2)
printenv CLASSPATH

# Define paths
SQM_DIR="/workspace/src"
BUILD_LOG="${SQM_DIR}/latestBuild.txt"
CONFIG_FILE="/workspace/data/config.json"
NUGET_SOURCE="/workspace/nuget_cache"

# Get the latest modified code file's timestamp
latest_code_file=$(find "$SQM_DIR" -type f -name "*.cs" -printf "%T@ %p\n" | sort -n | tail -1 | cut -d' ' -f2)
latest_code_time=$(stat -c %Y "$latest_code_file")
echo "Last edit $latest_code_time"

isBuilt=false  # assume it needs to be rebuilt
# Check if a build log exists
if [ -f "$BUILD_LOG" ]; then
    last_build_time=$(stat -c %Y "$BUILD_LOG")
    echo "Last build $last_build_time"

    # Compare the timestamps
    if [ "$latest_code_time" -le "$last_build_time" ]; then
        echo "No changes detected since the last build. Skipping build."
        isBuilt=true # Found that the build did not require rework
    else
        echo "Recent edits.... Rebuild required"
    fi
fi

# Navigate to source directory
cd "$SQM_DIR"

#ONLY BUILD IF THE LAST BUILD IS INVALID
if [ "$isBuilt" = false ]; then
    echo "Restoring project "
    # Restore dependencies using the specified NuGet source
    dotnet restore --source "$NUGET_SOURCE" "$SQM_DIR/SoftwareQualityMetrics.csproj"
    #dotnet clean
    dotnet build -c Release
    if [ $? -eq 0 ]; then
        echo "******** Build succeeded. Updating latestBuild.txt timestamp. ********"
        date > "$BUILD_LOG"
    fi
fi

# Run the application using the config file
dotnet run --project "$SQM_DIR" "$CONFIG_FILE"

# Trap to trigger the bell on script exit (normal or error)
# trap trigger_bell EXIT