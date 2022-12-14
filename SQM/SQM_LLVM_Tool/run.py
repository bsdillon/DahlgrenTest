
# This script runs Max's LLVM passes and checks your environment to ensure
# it has all tools necessary to run the pass

import subprocess
import sys
import os
import shutil
import glob
import time
import pathlib
import tempfile
import re

def compile_bitcode_using_make(analysis_src_dir):
  # TODO create temp dir, add "clang", "gcc", etc binaries + overload adding the arguments ''
  # Generate stubs for gcc/g++/clang/clang++ which call the built copy of clang to generate bitcode
  temp_dir = tempfile.gettempdir()
  stub_gcc = os.path.join(temp_dir, 'gcc')

  return None

def compile_bitcode_using_naive_clang(analysis_src_dir):
  # Create temp dir, for all *.c and *.cpp run the following commands:
  src_files = []
  for ext in ['*.c', '**/*.c', '*.cpp', '**/*.cpp']:
    for file in glob.glob(ext):
      file = os.path.abspath(file)
      if not file in src_files:
        src_files.append(file)

  temp_dir = tempfile.gettempdir()
  emitted_bitcode_dir = os.path.join(temp_dir, 'llvm-bitcode-for-{}'.format(os.path.basename(analysis_src_dir)))
  if not os.path.exists(emitted_bitcode_dir):
    os.makedirs(emitted_bitcode_dir)

  subprocess.run([
    'clang++', '-O0', '-g', '-gcolumn-info', '-Xclang', '-disable-llvm-passes', '-S', '-emit-llvm',
    '-I{}'.format(os.path.abspath(analysis_src_dir)),
    *src_files,
  ], cwd=emitted_bitcode_dir, check=True)

  emitted_bitcode_file = os.path.join(emitted_bitcode_dir, 'ZPassTestModule.ll')
  if not os.path.exists(emitted_bitcode_file):
    raise Exception('No bitcode found at {}'.format(emitted_bitcode_file))

  print('Generated bitcode at {}'.format(emitted_bitcode_file))

  return emitted_bitcode_file



def main():
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

  # for cmake_file in glob.glob('**/CMakeLists.txt', recursive=True):
  #   contents = ''
  #   with open(cmake_file, 'r') as fd:
  #     contents = fd.read()

  #   if not 'set(CMAKE_CXX_STANDARD 17' in contents:
  #     contents = re.sub(
  #       r'set\(CMAKE_CXX_STANDARD .*\)',
  #       'set(CMAKE_CXX_STANDARD 17 CACHE STRING "C++ standard to conform to")',
  #       contents
  #     )
  #     with open(cmake_file, 'w') as fd:
  #       fd.write(contents)

  #     print('Bumped CMAKE_CXX_STANDARD to 17 in {}'.format(cmake_file))

  # ^^ above was replaced with a global -DCMAKE_CXX_STANDARD=17

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
  shutil.copy('ZPassTestModule.cpp', os.path.join(zpass_build_dir, 'ZPassTestModule.cpp'))
  shutil.copy('ZPassTestModule.h', os.path.join(zpass_build_dir, 'ZPassTestModule.h'))
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

  # Finally do tasks (llvm bitcode etc.) to compile 
  args = sys.argv[1:]
  analysis_src_dir = os.path.join('..', 'SQM', 'test_cpp01')
  for a in args:
    if os.path.exists(a):
      analysis_src_dir = a

  bitcode_path = None
  if os.path.exists(os.path.join(analysis_src_dir, 'makefile')) or os.path.exists(os.path.join(analysis_src_dir, 'Makefile')):
    print('Using makefile to compile LLVM bitcode...')
    bitcode_path = compile_bitcode_using_make(analysis_src_dir)
  else:
    bitcode_path = compile_bitcode_using_naive_clang(analysis_src_dir)

  if not bitcode_path:
    print('Error generating bitcode!')
    return

  print('Running analysis on {} from {}'.format(bitcode_path, analysis_src_dir))

  subprocess.run([
    os.path.join(llvm_build_dir, 'bin', 'opt'),
    '-disable-output', bitcode_path, '-passes=zpasstestmodule'
  ], check=True)

  gph_output = os.path.join(os.path.dirname(bitcode_path), 'ZPassTestModule.gph')
  print('Generated {}'.format(gph_output))



if __name__ == '__main__':
  main()




