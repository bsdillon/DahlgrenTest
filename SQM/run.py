
# This script is designed to compile and run SoftwareAnalyzer2
# ony any OS, download any dependencies and
# print error messages on fatal misconfigurations
# which help operators determine changes to make.

# Usage:
#   python run.py
# Also fine:
#   python SQM/run.py

import subprocess
import sys
import os
import shutil
import glob
import time

import urllib.request

def find_under(directory, filename, case_sensitive=False):
  if not case_sensitive:
    filename = filename.lower()

  for root, dirs, files in os.walk(directory):
    if not case_sensitive:
      files = [x.lower() for x in files]

    if filename in files:
      return os.path.join(root, filename)

  return None

def ammend_path(filename, *search_paths):
  for search_p in search_paths:
    test_path = os.path.join(search_p, filename)
    if os.path.exists(test_path):
      # found it, add to PATH
      os.environ['PATH'] = search_p + os.pathsep + os.getenv('PATH', '')
      return

    else:
      # Search nearby
      test_path = find_under(search_p, filename)
      if test_path and os.path.exists(test_path):
        # found it, add to PATH
        os.environ['PATH'] = os.path.dirname(test_path) + os.pathsep + os.getenv('PATH', '')
        return


def build_llvm_tool():
  if not os.path.exists('build'):
    os.makedirs('build')

  llvm_proj_dir = os.path.join('build', 'llvm')
  if not os.path.exists(llvm_proj_dir):
    subprocess.run([
      'git', 'clone', '--depth', '1', 'https://github.com/llvm/llvm-project.git', llvm_proj_dir,
    ], check=True)

  llvm_src_dir = os.path.join(llvm_proj_dir, 'llvm')
  llvm_build_dir = os.path.join('build', 'llvm_build')
  
  if not os.path.exists(llvm_build_dir):
    os.makedirs(llvm_build_dir)

  compile_llvm_step1_flag = os.path.join('build', 'llvm_compile_step1.txt')
  if not os.path.exists(compile_llvm_step1_flag):
    subprocess.run([
      'cmake', '-G', 'Unix Makefiles', '-DLLVM_ALL_TARGETS=X86', '-DLLVM_TARGETS_TO_BUILD=X86', '-DCMAKE_CXX_STANDARD=17', os.path.abspath(llvm_src_dir),
    ], check=True, cwd=llvm_build_dir)

    subprocess.run([
      'make', '-j1',
    ], check=True, cwd=llvm_build_dir)

    pathlib.Path(compile_llvm_step1_flag).touch()

  # Now install ZPassTestModule into the LLVM directory structure by copying
  # files at the root into build/llvm/
  zpass_build_dir = os.path.join(llvm_src_dir, 'lib', 'Transforms', 'ZPassTestModule')
  if not os.path.exists(zpass_build_dir):
    os.makedirs(zpass_build_dir)

  print('Copying in ZPassTestModule.cpp...')
  shutil.copy(os.path.join('ZPassTestModule', 'ZPassTestModule.cpp'), os.path.join(zpass_build_dir, 'ZPassTestModule.cpp'))
  shutil.copy(os.path.join('ZPassTestModule', 'ZPassTestModule.h'), os.path.join(zpass_build_dir, 'ZPassTestModule.h'))
  # time.sleep(2) # debugging

  llvm_cmakelists = os.path.join(llvm_src_dir, 'lib', 'Transforms', 'CMakeLists.txt')

  llvm_cmakelists_content = ''
  with open(llvm_cmakelists, 'r') as fd:
    llvm_cmakelists_content = fd.read()
  if not 'ZPassTestModule' in llvm_cmakelists_content:
    with open(llvm_cmakelists, 'w') as fd:
      fd.write(llvm_cmakelists_content)
      fd.write(os.linesep)
      fd.write('add_subdirectory(ZPassTestModule)')

  zpass_cmakelists = os.path.join(zpass_build_dir, 'CMakeLists.txt')
  with open(zpass_cmakelists, 'w') as fd:
    fd.write('''
add_llvm_component_library(LLVMZPassTestModule
  ZPassTestModule.cpp

  DEPENDS
  intrinsics_gen

  LINK_COMPONENTS
  Core
  Support
)
''')

  llvm_cmakelists = os.path.join(llvm_src_dir, 'lib', 'Passes', 'CMakeLists.txt')

  llvm_cmakelists_content = ''
  with open(llvm_cmakelists, 'r') as fd:
    llvm_cmakelists_content = fd.read()
  if not 'ZPassTestModule' in llvm_cmakelists_content:
    llvm_cmakelists_content = llvm_cmakelists_content.replace('LINK_COMPONENTS', 'LINK_COMPONENTS'+os.linesep+'  ZPassTestModule')
    with open(llvm_cmakelists, 'w') as fd:
      fd.write(llvm_cmakelists_content)

  llvm_passbuilder = os.path.join(llvm_src_dir, 'lib', 'Passes', 'PassBuilder.cpp')
  llvm_passbuilder_content = ''
  with open(llvm_passbuilder, 'r') as fd:
    llvm_passbuilder_content = fd.read()

  if not 'ZPassTestModule/ZPassTestModule.h' in llvm_passbuilder_content:
    llvm_passbuilder_content = llvm_passbuilder_content.replace(
      '#include "llvm/Transforms/Vectorize/VectorCombine.h"',
      #'#include "llvm/Transforms/Vectorize/VectorCombine.h"'+os.linesep+'#include "llvm/Transforms/ZPassTestModule/ZPassTestModule.h"'+os.linesep
      '#include "llvm/Transforms/Vectorize/VectorCombine.h"'+os.linesep+'#include "'+os.path.abspath(os.path.join(llvm_src_dir, 'lib', 'Transforms', 'ZPassTestModule', 'ZPassTestModule.h'))+'"'+os.linesep
    )
    with open(llvm_passbuilder, 'w') as fd:
      fd.write(llvm_passbuilder_content)

  llvm_passreg = os.path.join(llvm_src_dir, 'lib', 'Passes', 'PassRegistry.def')
  llvm_passreg_content = ''
  with open(llvm_passreg, 'r') as fd:
    llvm_passreg_content = fd.read()
  
  if not 'ZPassTestModulePass' in llvm_passreg_content:
    llvm_passreg_content = llvm_passreg_content.replace(
      '#undef MODULE_PASS',
      'MODULE_PASS("zpasstestmodule", ZPassTestModulePass())'+os.linesep+'#undef MODULE_PASS'+os.linesep
    )
    with open(llvm_passreg, 'w') as fd:
      fd.write(llvm_passreg_content)

  compile_llvm_step2_flag = os.path.join('build', 'llvm_compile_step2.txt')
  if not os.path.exists(compile_llvm_step2_flag):
    subprocess.run([
      'cmake', '-G', 'Unix Makefiles', '-DLLVM_ALL_TARGETS=X86', '-DLLVM_TARGETS_TO_BUILD=X86', '-DCMAKE_CXX_STANDARD=17', os.path.abspath(llvm_src_dir),
    ], check=True, cwd=llvm_build_dir)

    subprocess.run([
      'make', '-j1',
    ], check=True, cwd=llvm_build_dir)

    pathlib.Path(compile_llvm_step2_flag).touch()

  # LLVM opt.exe has been built, record for SQM to read later:

  os.environ['SQM_LLVM_PASS_OPT_BIN'] = os.path.abspath(os.path.join(llvm_build_dir, 'bin', 'opt'))


def main(args=sys.argv):
  help = ("usage: run.py [java|cpp] [path/to/source/folder]\n\n"
          "Python support script to run SoftwareAnalyzer2.exe.\n\n"
          "Optional Arguments:\n"
          "   -h, --help              Show this help message and exit.\n"
          "   [java|cpp]              Specify java or cpp to analyze.\n"
          "   [path/to/source/folder] File path to source folder to analyze."
         )
  if (args[1] == "-h" or args[1] == "--help"):
    print(help)
    sys.exit(0)

  # Move to script directory
  os.chdir(os.path.abspath(os.path.dirname(__file__)))

  profile = 'Debug'
  #profile = 'Release'

  # Ammend the system path if we think we're on a windows machine with msbuild.exe
  # somewhere under Program Files
  if not 'linux' in sys.platform:
    ammend_path(
      'msbuild.exe',
      'C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin',
      'C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\Bin\\',
      'C:\\Windows\\Microsoft.NET\\Framework\\',
      'C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\',
    )

  # If we have msbuild available, build SoftwareAnalyzer2
  build_tool = None
  if shutil.which('xbuild'):
    build_tool = 'xbuild'
  elif shutil.which('msbuild'):
    build_tool = 'msbuild'

  if build_tool and not 'NO_MSBUILD' in os.environ:
    subprocess.run([
      build_tool, os.path.join('SoftwareAnalyzer2', 'SoftwareAnalyzer2.csproj'),
      '/t:Build', '/p:Configuration={profile}'.format(profile=profile),
    ], check=True)
  else:
    print('[warning] msbuild not found, cannot compile SoftwareAnalyzer2. Assuming already compiled on another machine.')

  build_path = os.path.join('SoftwareAnalyzer2', 'bin', profile)
  exe_path = os.path.join(build_path, 'SoftwareAnalyzer2.exe')
  if not os.path.exists(exe_path):
    print('[error] We expected the following file to be built but it does not exist: {exe_path}'.format(exe_path=exe_path))
    sys.exit(1)

  antlr_jar = os.path.join(build_path, 'antlr-complete.jar')
  if not os.path.exists(antlr_jar):
    antlr_url = 'https://www.antlr.org/download/antlr-4.9.1-complete.jar'
    print('Downloading ANTLR from {antlr_url} to {antlr_jar}'.format(antlr_url=antlr_url, antlr_jar=antlr_jar))
    urllib.request.urlretrieve(antlr_url, antlr_jar)

  # We pull files from https://github.com/antlr/grammars-v4
  # and put them under build_path.
  # Remember to put Lexers before Parsers!
  antlr_grammar_sources = [
    #'https://raw.githubusercontent.com/antlr/grammars-v4/master/java/java/JavaLexer.g4',
    #'https://raw.githubusercontent.com/antlr/grammars-v4/master/java/java/JavaParser.g4',
    
    #'https://raw.githubusercontent.com/antlr/grammars-v4/master/java/java8/Java8Lexer.g4',
    #'https://raw.githubusercontent.com/antlr/grammars-v4/master/java/java8/Java8Parser.g4',

    os.path.join('data', 'Java.g4'),

    'https://raw.githubusercontent.com/antlr/grammars-v4/master/cpp/CPP14Lexer.g4',
    'https://raw.githubusercontent.com/antlr/grammars-v4/master/cpp/CPP14Parser.g4',

    'https://raw.githubusercontent.com/okellogg/ada_antlr_grammar/master/antlr4/ada.g4',
  ]
  antlr_grammar_paths = []
  for g in antlr_grammar_sources:
    name = os.path.basename(g)
    grammar_path = os.path.join(build_path, name)
    antlr_grammar_paths.append(grammar_path)

    if not os.path.exists(grammar_path):
      if g.lower().startswith('http'):
        url = g
        print('Downloading Grammar from {url} to {grammar_path}'.format(url=url, grammar_path=grammar_path))
        urllib.request.urlretrieve(url, grammar_path)
      else:
        print('Copying Grammar from {g} to {grammar_path}'.format(g=g, grammar_path=grammar_path))
        shutil.copy(g, grammar_path)

  # Now that we have grammars, use ANTLR to compile them
  compiled_antlr_grammar_dir = os.path.join(build_path, 'compiled-antlr-grammars')
  if not os.path.exists(compiled_antlr_grammar_dir):
    os.makedirs(compiled_antlr_grammar_dir)

  # Generate *.java
  skipped_grammar_javagen = 0
  for grammar_path in antlr_grammar_paths:
    grammar_path_completed = grammar_path+".java_gen_complete"
    if os.path.exists(grammar_path_completed):
      print('Skipping generation of Java for Grammar {}'.format(grammar_path))
      skipped_grammar_javagen += 1
      continue

    print('Generating Java for Grammar {}'.format(grammar_path))
    try:
      subprocess.run([
        'java', '-Xint', '-cp', os.path.abspath(antlr_jar), 'org.antlr.v4.Tool',
        '-o', os.path.abspath(compiled_antlr_grammar_dir),
        os.path.abspath(grammar_path)
      ], check=True)
    except Exception as e:
      print(e)
      print('[ WARNING ] Could not generate java for grammar {}'.format(grammar_path))
      time.sleep(1)

    with open(grammar_path_completed, 'w') as fd:
        fd.write("done")

  can_skip_java_compile = skipped_grammar_javagen == len(antlr_grammar_paths)
  if not can_skip_java_compile or 'FORCE_JAVA_COMPILE' in os.environ:
    print('Compiling all grammars within {}'.format(compiled_antlr_grammar_dir))
    java_src_files = [os.path.abspath(x) for x in glob.glob(os.path.abspath(compiled_antlr_grammar_dir)+os.path.sep+'*.java')]
    # Compile *.java
    subprocess.run([
      'javac', '-cp', os.path.abspath(antlr_jar)+os.pathsep+os.path.abspath(compiled_antlr_grammar_dir),
      *java_src_files
    ], check=True)
  else:
    print('We skipped all java source gen, so we are also skipping java class file gen under the assumption it has already been done')

  os.environ['CLASSPATH'] = os.getenv('CLASSPATH', '') + os.pathsep + os.path.abspath(antlr_jar) + os.pathsep + os.path.abspath(compiled_antlr_grammar_dir)

  os.environ['SQM_DATA_DIR'] = os.path.abspath(os.path.join('SoftwareAnalyzer2', 'bin', 'TestAnalysis'))

  # Finally build llvm tool (only if used w/ env var SQM_TOOL=LLVM set)
  if 'LLVM' in os.environ.get('SQM_TOOL', 'ANTLR'):
    build_llvm_tool()
  else:
    print('WARNING: Skipping LLVM tool build because SQM_TOOL={}'.format(os.environ.get('SQM_TOOL', '')))
    print('         Set SQM_TOOL=LLVM before running to perform LLVM build (eg "export SQM_TOOL=LLVM" or "setenv SQM_TOOL=LLVM"')
    print('')
    time.sleep(2)

  exec_cmd = []

  if 'linux' in sys.platform:
    if not shutil.which('mono'):
      print('[error] Linux systems need the Mono runtime installed to execute dotnet <v5 binaries!')
      sys.exit(1)

    exec_cmd = ['mono', exe_path]

  else:
    exec_cmd = [exe_path]

  # Append args to run.py to exec_cmd
  exec_cmd.extend(args[1:])

  if not 'BUILDONLY' in os.environ:
    print('CLASS_PATH={}'.format(os.environ['CLASSPATH']))
    print('Running {exec_cmd}'.format(exec_cmd=exec_cmd))
    subprocess.run(exec_cmd)


if __name__ == '__main__':
  main()

