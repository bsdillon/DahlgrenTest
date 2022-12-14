
# Package Installation and Setup
Further instructions also available on the SQM Installation Guide (Linux).

## Ubuntu

```bash
# JDK
sudo  apt install -y openjdk-8-jdk

# Mono build for C# compilation (see https://www.mono-project.com/download/stable/)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
# .NET 4 Development
sudo apt install -y mono-devel
```

## Arch Linux

```bash
# .NET 4 Development
yay -S mono mono-msbuild

```
#### Manjaro Distribution
```bash
# .NET 4 Development
sudo pacman -S mono mono-msbuild
```

# Compile + run commands

Using `run.py`:

```bash
python run.py cpp ./test_cpp01
```

Running Directly:

```bash
# FOR FUTURE DEVLEOPMENT: migrate to .NET Core / .NET 5 for greater Windows/Linux compatibility
# .NET Core / .NET 5 Developmnet
# sudo apt-get install -y dotnet-sdk-5.0e
# dotnet SoftwareAnalyzer2

# .NET 4 Development (depreciated)
msbuild SoftwareAnalyzer2/SoftwareAnalyzer2.csproj
export CLASSPATH='/path/to/antlr-4.1-complete.jar'
mono SoftwareAnalyzer2/bin/Debug/SoftwareAnalyzer2.exe

# (If msbuild fails on Linux - use xbuild - NOTE: also depreciated):
xbuild SoftwareAnalyzer2/SoftwareAnalyzer2.csproj
export CLASSPATH='/path/to/antlr-4.1-complete.jar'
mono SoftwareAnalyzer2/bin/Debug/SoftwareAnalyzer2.exe
```

# Debugging

If mono process is stuck on CLI in Linux, we can get a stack trace printed for debugging purposes by signaling the mono process to quit:
```bash
# First, open another CLI tab/window away from mono process

# Second, find and take note of the running mono process ID (PID) - (process with "mono --debug SoftwareAnalyzer2/...") using:
ps all

# Third, we can now signal that mono PID to QUIT and print the current stack trace of running threads:
kill -QUIT $PID

# Lastly, return to the original running mono process to find printed stack trace of running threads

# To actually kill that process, use:
kill -9 $PID
```

