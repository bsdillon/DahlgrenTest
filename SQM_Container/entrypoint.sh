#!/bin/bash

# Check if the /code volume is available (mounted)
if [ -d "/code" ]; then
    echo "Code directory found at /code. Compiling..."

    # Change to the code directory
    cd /code

    # Run dotnet restore
    echo "Restoring NuGet packages..."
    dotnet restore --packages /code/nuget /code/simple.csproj

    # Run dotnet build
    echo "Building the project..."
    dotnet build  /code/simple.csproj

    # Check if the build was successful
    if [ $? -eq 0 ]; then
        # Run the project (if build was successful)
        echo "Running the project..."
        dotnet run --project /code/simple.csproj
    else
        echo "Build failed. Exiting..."
        exit 1
    fi
else
    echo "No code directory found. Please mount a code volume."
    exit 1
fi