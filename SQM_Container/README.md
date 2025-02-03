# Build the .Net libraries
NuGet is the package manager for the .NET platform. NuGet allows developers to add, update, and manage libraries or packages in their projects. It automatically resolves dependencies required by the packages by pulling libraries into a local space.

- podman build -t nuget_builder -f nuget_Dockerfile
- podman run -v ./nuget:/workspace/nuget_cache 
             -v ./src:/workspace/code 
             nuget_builder

This will download all the required dependencies for the project into the nuget folder.

# Build the Language Grammars
ANTLR is a language parsing tool that uses a lexer and parser grammar file to interpret the code files it reads. There are a number of these files downloaded in /grammars and they are built into full language files in /compiled_grammars.

- podman build -t grammar_builder -f grammar_Dockerfile  
- podman run -v ./grammars:/workspace/grammars 
             -v ./compiled_grammars:/workspace/compiled_grammars 
             grammar_builder

This will compile the grammars and put all the required fiels in that folder.

# Build SQM

- podman build -t sqm_image -f sqm_Dockerfile  
- podman run  -v ./src:/workspace/src -v ./data:/workspace/data sqm_image
- podman ps -a

IMAGE                      CREATED        STATUS                    NAMES
localhost/sqm_image:latest 3 minutes ago  Exited (1) 2 minutes ago  youthful_torvalds

- podman start -a youthful_torvalds