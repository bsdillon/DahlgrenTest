from robot.api.deco import keyword
from py4j.java_gateway import JavaGateway
gateway = JavaGateway()# connect to the JVM

import shutil
import os
import time
import subprocess

@keyword(name="Label Region")
def _label_region(x,y,w,h,text):
    gateway.entry_point.getRegion(int(x), int(y), int(w), int(h))
    gateway.entry_point.getScreen().selectRegion(text)

@keyword(name="Capture Screen At")
def _capture_and_move(x, y, w, h, filename):
    reg = gateway.entry_point.getRegion(int(x), int(y), int(w), int(h))
    #img = gateway.entry_point.getScreen("127.0.0.1",5900).capture(reg).getFilename()

    img = gateway.entry_point.getScreen().capture(reg).getFilename()
    shutil.move(img, filename)

#@keyword(name="Sikuli Click")
def sikuliClick(x, y):
    gateway.entry_point.getScreen().click(gateway.jvm.org.Location(int(x), int(y)))

#@keyword(name="Complete Animation")
def complete_and_move(tmpimgdir, filename):
    #create GIF from the images
    #os.mkdir(tmpimgdir).
    cmd = ['convert',
        '-verbose',
        '-antialias',
        '-delay', '50',
        '-loop', '0',
        tmpimgdir+os.sep+"*",
        filename]
    p = subprocess.Popen(cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    stdout, stderr = p.communicate()
    rc=p.returncode
    if rc != 0:
        tmpE = ""
        for line in stdout.splitlines():
            tmpE = tmpE + line +"\n"
        raise RuntimeError("Error calling helper, rc=" + str(rc) + "\n Error:"+tmpE)

    #cleanup image files
    cwd = os.getcwd()
    os.chdir(tmpimgdir)
    for file in os.listdir(tmpimgdir):
        os.remove(file)
    os.chdir(cwd)
    os.rmdir(tmpimgdir)

    return filename

#@keyword(name="Capture Animation At")
def animation_and_move(x, y, w, h, imgdir, filename, number):

    #capture <number> of images for gifmaker and store in the same folder
    reg = gateway.entry_point.getRegion(int(x), int(y), int(w), int(h))
    replay_dest=os.path.join(imgdir,"gifmaking")
    os.mkdir(replay_dest)
    for i in range(int(number)):
        tmp = gateway.entry_point.getScreen().capture(reg).getFilename()
        shutil.move(tmp, replay_dest)
        time.sleet(.2)

    #create GIF from the images
    cmd = ['convert',
        '-verbose',
        '-antialias',
        '-delay', '50',
        '-loop', '0',
        replay_dest+os.sep+"*",
        filename]
    p = subprocess.Popen(cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    stdout, stderr = p.communicate()
    rc=p.returncode
    if rc != 0:
        tmpE = ""
        for line in stdout.splitlines():
            tmpE = tmpE + line +"\n"
        raise RuntimeError("Error calling helper, rc=" + str(rc) + "\n Error:" +tmpE)

    #cleanup image files
    cwd = os.getcwd()
    os.chdir(replay_dest)
    for file in os.listdir(replay_dest):
        os.remove(file)
    os.chdir(cwd)
    os.rmdir(replay_dest)

    return filename
