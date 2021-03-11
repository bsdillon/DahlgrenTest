
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


def main(args=sys.argv):
  # Move to script directory
  os.chdir(os.path.abspath(os.path.dirname(__file__)))

  profile = 'Debug'
  #profile = 'Release'

  # Ammend the system path if we think we're on a windows machine with msbuild.exe
  # somewhere under Program Files
  if not 'linux' in sys.platform:
    ammend_path(
      'msbuild.exe',
      'C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\Bin\\',
      'C:\\Windows\\Microsoft.NET\\Framework\\',
    )

  # If we have msbuild available, build SoftwareAnalyzer2
  if shutil.which('msbuild'):
    subprocess.run([
      'msbuild', os.path.join('SoftwareAnalyzer2', 'SoftwareAnalyzer2.csproj'),
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

  os.environ['CLASSPATH'] = os.getenv('CLASSPATH', '') + os.pathsep + os.path.abspath(antlr_jar)

  os.environ['SQM_DATA_DIR'] = os.path.abspath(os.path.join('SoftwareAnalyzer2', 'bin', 'TestAnalysis'))

  exec_cmd = []

  if 'linux' in sys.platform:
    if not shutil.which('mono'):
      print('[error] Linux systems need the Mono runtime installed to execute dotnet <v5 binaries!')
      sys.exit(1)

    exec_cmd = ['mono', exe_path]

  else:
    exec_cmd = [exe_path]

  print('Running {exec_cmd}'.format(exec_cmd=exec_cmd))
  subprocess.run(exec_cmd)


if __name__ == '__main__':
  main()

