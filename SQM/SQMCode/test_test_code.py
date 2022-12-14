
# Running this script lets us verify that the contents of
# test_cpp01 and test_java01 are valid cpp/java code.

import os, sys, subprocess

# cpp

os.makedirs(os.path.join('test_cpp01', 'obj'), exist_ok=True)

subprocess.run([
  'g++', 'main.cpp', 'func2.cpp', '-o', os.path.join('obj', 'main'),
], cwd='test_cpp01', check=True)

subprocess.run([
  os.path.join('obj', 'main')
], cwd='test_cpp01', check=True)


# java

os.makedirs(os.path.join('test_java01', 'obj'), exist_ok=True)

subprocess.run([
  'javac', '-d', os.path.join('obj'), 'A.java', 'B.java',
], cwd='test_java01', check=True)

subprocess.run([
  'java',
  '-cp', 'obj'+os.pathsep+os.path.join('obj', 'A.class')+os.pathsep+os.path.join('obj', 'B.class'),
  'A',
], cwd='test_java01', check=True)


