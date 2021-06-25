
# Packages

## Ubuntu

```bash
# JDK
sudo  apt install -y openjdk-11-jdk

# Mono build for C# compilation (see https://www.mono-project.com/download/stable/)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install -y mono-devel
```

## Arch Linux

```bash
# .net core / .net 5 development
yay -S dotnet-sdk dotnet-runtime
# .net 4 development (deprecated)
yay -S mono mono-msbuild

```

# Compile + run commands

Using `run.py`:

```bash
python run.py cpp ./test_cpp01
```

running directly:

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


