#!/bin/bash
echo "Starting .Net restore process"

# Now restore the NuGet packages
dotnet restore --packages /workspace/nuget_cache /workspace/code/SoftwareQualityMetrics.csproj

echo "Done"