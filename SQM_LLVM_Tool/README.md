The following is modified from Lucas Durham's "Clang_LLVM Installation Guide" which is originally located in \\SQM\\LLVM in the V52 shared drive. I've added some comments headed with "MM:" in a few places.

# LLVM/Clang Installation
##### Summary
Depending on the configuration of the machine you are attempting to install LLVM on, you may experience all, none, or more issues than documented within this document. More investigation will provide further correlations and results. Overall, the configuration of LLVM in a Windows environment is very fragile and requires specific care to ensure that packages, software, and source files successfully work in unity.
##### Required Software \(MM: modified to be what I'm using at the time of writing\)
- Visual Studio 2019 Community
- CMake 3.20.X
- Clang/LLVM 12.0.0
- Python 3.8
- GNUWinTools32 \(MM: not clear to me how necessary this one is\)
##### Potential Bottlenecks/Issues
- Visual Studio Installation of Clang/CMake/Python 
	1. Visual Studio 2019 provides optional additional downloads of software/programs such as clang, CMake, and Python when installing Visual Studio 2019, but these software installations seem to be unstable and not intuitively placed. 
- PATH Environment Variables
	1. Correctly mapping PATH variables is critically important. Failing to set the PATH values correctly will produce errors in installation.
- Installing LLVM Using an Installer Does Not Provide all Required Packages
	1. LLVM provided by the installer is missing llvm-dis.exe and lli.exe so it is necessary to build LLVM from source. Clang seems to provide more source files that may be necessary, but the installer seems to provide a functional version of clang.
- Clang
	1. stdio.h not found when compiling. Ensure that the Windows System32 directory is mapped correctly \(C:\Windows\System32\). If that does not solve the issue, but you know where stdio.h is located, add “-isystem C:\file\location\here” to the clang command for each file you wish to include. To check where clang is looking for included files, add the “-v” flag.
- Most Installations/Builds Take Roughly and Hour to Complete \(~5/6 hours total\) \(MM: times are variable, it did not take this long on my machine\)
	1. Visual Studio Installation Time: ~30 minutes
	2. Building LLVM from Source: ~1 hour for each “Release” and “Debug” mode
	3. Building All Modules within LLVM.sln: ~2 hours
	4. Python test cases: ~30 mins
- Installation of all Required Packages Requires Upwards of 30 GB of Disk Space
	1. If disk space is an issue on the machine you wish to install on, you must ensure that you have at least 30 GB of storage before installation.
##### High Level Process Overview
1. Install Visual Studio 2019 Community
2. Install CMake
3. Install Python 3.8
4. Install Clang
5. Install/Build LLVM Release/Debug Mode
6. Install/Build Clang Release/Debug Mode
7. Create .c File to Test clang, lli, llvm-dis, etc.
8. Build All Modules in LLVM.sln
9. Run Python Test Cases
##### Step By Step Detailed Guide
1. Go to <https://visualstudio.microsoft.com/downloads/>
	- Download Visual Studio Community \(MM: Version 16.10.X at the time of writing\)
	- Run the VS Installer
		-.NET Framework \4.6 or higher is required to run the installer. This will likely be a non-issue but if it gives you problems, download the framework from <https://microsoft.com/en-us/download/details.aspx?id=48137>
	- Select: “Desktop Development with C\+\+”
		- Deselect “Test Adapter for Boost.Test/Google Test”
		- Select the newest Windows SDK \(should already be selected\)
	- Restart Computer
2. Go to <https://cmake.org/download>
	- Ensure that no previous version of CMake exists
	- Download “Window win64-x64 Installer \(MM: for me this is cmake-3.20.1-windows-x86_64.msi\)
	- Run Installer 
	- Add CMake Path for All Users
	- Install in the Default “C:\\Program Files\\CMake” Folder
3. Go to <https://www.python.org/downloads/>
	- Select the latest stable release
	- Download the installer \(MM: for me this is python-3.8.6-amd64.exe\)
	- Run Installer
	- Install for All Users in “C:\\Python38\\” \(MM: this step and the next may be different for you\)
	- Ensure that “C:\\Python38\\” is contained in PATH. If not, add “C:\\Python38\\” to PATH \(This should be an option within the installer GUI\)
	- Restart Computer
4. Go to <https://releases.llvm.org/>
	- Create a new directory in “C:\\Users\\Maxwell\\Documents” named “llvmInstall” \(Note: Replace all commands in the document containing “Maxwell” with your specific username.\)
	- Select the "download" option of the LLVM version you wish to install \(MM: Version 12.0.0 at the time of writing\)
	- Download the source code via the GitHub page linked here \(MM: llvm-12.0.0.src.tar.xz\)
	- Move "llvm-12.0.0.src.tar.xz" from your downloads folder to "C:\\Users\\Maxwell\\Documents\\llvmInstall"
	- Extract “llvm-12.0.0.src.tar.xz” into the same folder “\\llvmInstall” (Use 7Zip or equivalent “Extract Here”)
	- Extract “llvm-12.0.0.src.tar into the same folder “\\llvmInstall”
	- You should now have a directory called “C:\\Users\\Maxwell\\llvmInstall” with two files named “llvm-12.0.0.src.tar.xz” “llvm-12.0.0.src.tar” and a folder named “llvm-12.0.0.src”
5. Install/Build LLVM
MM: in order to run the SQM pass correctly, check the CMakeLists.txt file located in \llvm-12.0.0.src\ and make sure that the CXX_STANDARD is 17 or higher. The SQM pass uses the `filesystem` library which only exists in C++17 and above. There will be a lot of deprecation warnings when you install LLVM this way, but this doesn't seem to have any effect on using it.
	- Click the start button and use the search bar to search and run “x64 Native Tools Command Prompt For VS 2019”
	- Type `mkdir C:\\Users\\Maxwell\\Documents\\llvmInstall\\llvm-12.0.0.src\\build-release`
	- Type `cd C:\\Users\\Maxwell\\Documents\\llvmInstall\\llvm-12.0.0.src\\build-release`
	- Type `"c:\\Program Files\\CMake\\bin\\cmake.exe" .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX=C:\\Users\\Maxwell\\llvm\+clang-12.0.0-win64-msvc-release -DCMAKE_PREFIX_PATH=C:\\Users\\Maxwell\\llvm\+clang-12.0.0-win64-msvc-release -DCMAKE_BUILD_TYPE=Release -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AVR;RISCV" -DLLVM_ENABLE_LIBXML2=OFF`
	- Type `msbuild /m –p:Configuration=Release INSTALL.vcxproj`
	- Type `mkdir C:\\Users\\Maxwell\\Documents\\llvmInstall\\llvm-12.0.0.src\\build-debug`
	- Type `cd C:\\Users\\Maxwell\\Documents\\llvmInstall\\llvm-12.0.0.src\\build-debug`
	- Type `"c:\\Program Files\\CMake\\bin\\cmake.exe" .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX=C:\\Users\\Maxwell\\llvm\+clang-12.0.0-win64-msvc-debug -DCMAKE_PREFIX_PATH=C:\\Users\\Maxwell\\llvm\+clang-12.0.0-win64-msvc-debug -DCMAKE_BUILD_TYPE=Debug -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AVR;RISCV" -DLLVM_ENABLE_LIBXML2=OFF`
	- Type `msbuild /m INSTALL.vcxproj`
6. Build/Install Clang
	- Go to <https://releases.llvm.org/>
	- Select the "download" option of the LLVM version you wish to install \(MM: Version 12.0.0 at the time of writing\)
	- Download the pre-built binary via the GitHub page linked here \(MM: LLVM-12.0.0-win64.exe\)
	- Run the executable installer with the default settings and make sure to set the PATH for at least your user.
7. Run Test Cases
	- Go to <https://llvm.org/docs/GettingStartedVS.html> if you would like to reference the steps for running test cases using the LLVM Tool Chain.
	- IF all seven steps below are successfully completed, the tool chain test case is complete.
		1. First, create a simple C file, name it ‘hello.c’:
			```
			#include <stdio.h>
			int main() {
				printf("hello world\n");
				return 0;
			}
			```
		2. Next, compile the C file into an LLVM bitcode file:
		`C:\..> clang -c hello.c -emit-llvm -o hello.bc`
		This will create the result file hello.bc which is the LLVM bitcode that corresponds the compiled program and the library facilities that it required. You can execute this file directly using lli tool, compile it to native assembly with the llc, optimize or analyze it further with the opt tool, etc.
		3. Run the program using the just-in-time compiler:
		`C:\..> lli hello.bc`
			- You will likely have to reference lli and llvm-dis directly. To run the above command in step three, for example, type: `“C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\Release\bin\lli.exe” hello.bc`
		4. Use the llvm-dis utility to take a look at the LLVM assembly code:
		`C:\..> llvm-dis < hello.bc | more`
			- For step four, type:
			`“C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\Release\bin\llvm-dis.exe” < hello.bc | more`
			- Continue this theme for any command that references an llvm executable if the base command does not work.
		5. Compile the program to object code using the LLC code generator:
		`C:\..> llc -filetype=obj hello.bc`
		6. Link to binary using Microsoft link:
		`C:\..> link hello.obj -defaultlib:libcmt`
		7. Execute the native code program:
		`C:\..> hello.exe`
	- Complete steps 6-9 under “Getting Started”.
		- Ensure that steps 6 and 7a complete successfully at the bare minimum to test the installation/build status of LLVM.
			- LLVM.sln is located in llvmInstall\llvm-12.0.0.src\build-release or llvmInstall\llvm-12.0.0.src\build-debug
		- For step 7a, open “LLVM.sln” in Visual Studio, right click on ALL_BUILD, and click build. This process will take a while (~2 hours (MM: environment dependent)). If you plan to test steps 8-9, it would be best to use the “LLVM.sln” file in the “build-debug” folder.
		- Steps 6-9 as referenced above are below for your convenience. 
		6. Start Visual Studio
			- In the directory you created the project files will have an llvm.sln file, just double-click on that to open Visual Studio.
		7. Build the LLVM Suite:
			- The projects may still be built individually, but to build them all do not just select all of them in batch build (as some are meant as configuration projects), but rather select and build just the ALL_BUILD project to build everything, or the INSTALL project, which first builds the ALL_BUILD project, then installs the LLVM headers, libs, and other useful things to the directory set by the CMAKE_INSTALL_PREFIX setting when you first configured CMake.
			- The Fibonacci project is a sample program that uses the JIT. Modify the project’s debugging properties to provide a numeric command line argument or run it from the command line. The program will print the corresponding fibonacci value.
		8. Test LLVM in Visual Studio:
			- If %PATH% does not contain GnuWin32, you may specify LLVM_LIT_TOOLS_DIR on CMake for the path to GnuWin32.
			- You can run LLVM tests by merely building the project “check”. The test results will be shown in the VS output window.
		9. Test LLVM on the command line:
		The LLVM tests can be run by changing directory to the llvm source directory and running:
		`C:\..\llvm> python ..\build\bin\llvm-lit --param build_config=Win32 --param build_mode=Debug --param llvm_site_config=../build/test/lit.site.cfg test`
		This example assumes that Python is in your PATH variable, you have built a Win32 Debug version of llvm with a standard out of line build. You should not see any unexpected failures, but will see many unsupported tests and expected failures.
		
		A specific test or test directory can be run with:
		`C:\..\llvm> python ..\build\bin\llvm-lit --param build_config=Win32 --param build_mode=Debug --param llvm_site_config=../build/test/lit.site.cfg test/path/to/test`
	- Go to <https://sourceforge.net/projects/getgnuwin32/> and download the correct version of gnuwintools32 for your machine. Execute the installer and ensure that the PATH variable is set for at least your user. (C:\Users\Maxwell\GetGnuWin32\bin\)
	- To run the python test cases, type: `C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\Release\bin\llvm-lit.py --param build_config=Wind32 --param build_mode=Release --param llvm_site_config=C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\test\lit.site.cfg test`
	- Also, run the same test case using build_mode=Debug and changing the paths to reference the respective files from the build-debug folder you created. The test cases take around 30 minutes to an hour each to complete.
	- You should see the majority of your tests as expected passes. (MM: I recall having unexpected failures when I ran this that I could not figure out how to resolve, but that did not appear to impact anything else)
	
# Installing and using the SQM pass
The pass itself and most of the relevant directories are named "ZPassTestModule" - originally "ZPassTest" since starting with "Z" made it easy to locate and identify the pass, and "Module" since this is an LLVM module-based successor to the first version of the pass I wrote.
Changing the name means editing it in several different places including the .h and .cpp files, so I just haven't bothered.

##### Installing the SQM pass
Read the documentation at <https://llvm.org/docs/WritingAnLLVMNewPMPass.html> for additional details.
1. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\lib\Transforms
2. Create a new directory named "ZPassTestModule" and add `add_subdirectory(ZPassTestModule)` to the CMakeLists.txt file
3. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\lib\Transforms\ZPassTestModule and add the ZPassTestModule.cpp file here
4. Also in this directory, add a new CMakeLists.txt file:
	```
	add_llvm_component_library(LLVMZPassTestModule
	ZPassTestModule.cpp

	DEPENDS
	intrinsics_gen

	LINK_COMPONENTS
	Core
	Support
	)

	```
If you're having trouble, copy, paste, and modify the CMakeLists.txt file located in C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\lib\Transforms\HelloNew
5. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\lib\Passes
6. Add "ZPassTestModule" to the LINK_COMPONENTS section of the CMakeLists.txt located here
7. Open PassBuilder.cpp in this directory and add `#include "llvm/Transforms/ZPassTestModule/ZPassTestModule.h"` to the bottom of the `#include` section
8. Open PassRegistry.def in this directory and add `MODULE_PASS("zpasstestmodule", ZPassTestModulePass())` into the section between `#ifndef MODULE_PASS` and `#undef MODULE_PASS`
9. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\include\llvm\Transforms
10. Create a new directory named "ZPassTestModule"
11. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\include\llvm\Transforms\ZPassTestModule and add the ZPassTestModule.h file here
12. Go to C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-debug or C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release and open LLVM.sln there
13. Go to "File", "Open > File" and open C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\lib\Transforms\ZPassTestModule\ZPassTestModule.cpp
14. Build this file
	- I usually use the following system:
		1. In the Solution Explorer, open "Tools", find "opt", right-click that and select "Build". WARNING: misclicking "Rebuild" will take a very long time to complete even on a decent desktop and will cause your entire machine to slow down. As far as I can tell, this process cannot be stopped, since cancelling it and then attempting to "Build" as normal will go through "Rebuild" to resolve the cancellation.
15. If there are no errors, then the pass is now ready to be used.
	- The following commands require that you know exactly which of four potential locations the compiled "opt.exe" is located. You may wish to double check the following locations:
		1. C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\Release\bin
		2. C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-release\Debug\bin
		3. C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-debug\Release\bin
		4. C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-debug\Debug\bin
	- The correct directory should be the directory of the LLVM.sln file you chose to open, and then the Debug or Release directory depending on how you built it in Visual Studio

##### Using the SQM pass
1. Go to the directory containing the .cpp file(s) you want to run through the pass
2. Use `clang++ -O3 -g -gcolumn-info -Xclang -disable-llvm-passes -S -emit-llvm [.cpp]` to compile the relevant files to LLVM .ll bitcode files. You may use `*.cpp` to compile all of the files in the current directory, or list them in the case of `a.cpp b.cpp c.cpp`, etc.
	- I don't know how to automate this process for the subdirectories of the current working directory, so I've just done that manually for now
3. If there are multiple files that are expected to be linked in the program, link them using `"C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-debug\Debug\bin\llvm-link.exe" -S -o [linkedName].ll [filesToLink*].ll`, where `linkedName` is some name for the .ll file resulting from the linking process and `filesToLink` is a list of files to be linked as in step 2
	- I don't know how to automate this process for the subdirectories of the current working directory, so I've just done that manually for now
4. Run `"C:\Users\Maxwell\Documents\llvmInstall\llvm-12.0.0.src\build-debug\Debug\bin\opt.exe" -disable-output [.ll] -passes=zpasstestmodule`, where `.ll` is the LLVM bitcode file you want to run through the pass. This can be a .ll resulting from a single .cpp file or from the linking process
	- The name of the pass as used by the `-passes` argument is the name found in PassRegisty.def as shown in step 8 above.

The pass should output a .gph file and two .csv files, which are the nodes and edges in a format usable by Gephi (though they may not be complete in terms of the SQM specification - the Nodes .csv lists only the numerical ID and text Label of the SQM node and the Edges .csv only lists the Source and Target nodes and the text Label)