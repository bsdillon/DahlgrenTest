
# Packages

```bash
# .net core / .net 5 development
yay -S dotnet-sdk dotnet-runtime

# .net 4 development (deprecated)
yay -S mono mono-msbuild
```

# Compile + run commands

```bash
# TODO become familliar with the "dotnet" suite
# and document the future build process that microsoft
# wants the world to use
dotnet SoftwareAnalyzer2 TODO

# .net 4 development (deprecated)
msbuild SoftwareAnalyzer2/SoftwareAnalyzer2.csproj
export CLASSPATH='/path/to/antlr-4.1-complete.jar'
mono SoftwareAnalyzer2/bin/Debug/SoftwareAnalyzer2.exe
```


