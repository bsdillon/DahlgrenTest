import py4j.GatewayServer;
import org.sikuli.script.support.*;
import org.sikuli.script.*;
import org.sikuli.vnc.*;
import java.io.*;
import java.util.*;

//Most recent documentation is https://javadoc.io/static/com.sikulix/sikulixapi/2.0.1/index.html0


public class SikuliEntryPoint {
    private Map<String, Screen> screens = new HashMap<String, Screen>();
    private Map<String, VNCScreen> vnc_screens = new HashMap<String, VNCScreen>();
    private IScreen currentScreen = null;

    private boolean logOn = true;

    private void log(String s)
    {
        if(logOn)
        {
            System.out.println(s);
        }
    }

    public SikuliEntryPoint() {
        log("Gateway Server Started");
    }

    public void addImagePath(String path, int id)
    {
        log("For ID#"+id+" adding image path: "+path);
        ImagePath.add(path);
    }

    public static void main(String[] args) {
        ImagePath.add(System.getProperty("user.dir"));
        GatewayServer gatewayServer = new GatewayServer(new SikuliEntryPoint());
        gatewayServer.start();
    }

    public IScreen getScreen() {
        log("Accessed screen w/o id");
        if(!screens.containsKey(""))
        {
          screens.put("",new Screen());
        }
        currentScreen = screens.get("");
        return screens.get("");
    }

    public IScreen getScreen(int id) {
        log("Accessed screen w/id");
        if(!screens.containsKey(""+id))
        {
          screens.put(""+id,new Screen(id));
        }
        currentScreen = screens.get(""+id);
        return screens.get(""+id);
    }

    public IScreen getScreen(String ip, int port) {
        log("Accessed screen @ "+ip+":"+port);
        String vnc = ip+":"+port;
        if(!vnc_screens.containsKey(vnc))
        {
                             //VNCScreen.start(ip, port, connectionTimeout, timeout)
          vnc_screens.put(vnc, VNCScreen.start(ip, port, 10,                1000));
        }

        if( ! vnc_screens.get(vnc).isRunning())
        {
          vnc_screens.put(vnc, VNCScreen.start(ip, port, 10,                1000));
        }

        currentScreen = vnc_screens.get(vnc);
        return vnc_screens.get(vnc);
    }

    public IScreen getScreen(String ip, int port, String password) {
        log("Accessed screen @ "+ip+":"+port);
        String vnc = ip+":"+port;
        if(!vnc_screens.containsKey(vnc))
        {
                             //VNCScreen.start(ip, port, password, connectionTimeout, timeout)
          vnc_screens.put(vnc, VNCScreen.start(ip, port, password, 10,                1000));
        }

        if( ! vnc_screens.get(vnc).isRunning())
        {
          vnc_screens.put(vnc, VNCScreen.start(ip, port, password, 10,                1000));
        }

        currentScreen = vnc_screens.get(vnc);
        return vnc_screens.get(vnc);
    }

    public void DebugHighlight(Region reg) {
        //BSD is this how we debug the GUI? Not in SikuliLibrary
        log("Highlighting region "+reg);
        reg.highlight(.25);
    }

    public Pattern createPattern(String imagePath)
    {
        log("Creating pattern from "+imagePath);
        return new Pattern(imagePath);
    }

    public boolean checkAndSetRemote(IScreen remoteScreen, Object obj, boolean remote) {
        if(remote && !remoteScreen.isOtherScreen()) {
            throw new RuntimeException("Null other screen for supposedly remote operation");
        }
        if(!remote && remoteScreen.isOtherScreen()) {
            throw new RuntimeException("Supposedly local operation on a remote screen");
        }

        if (obj instanceof Region) {
            Region tmp = (Region) obj;
            if (tmp.isOtherScreen()!=remote) {
                //mismatch
                tmp.setOtherScreen();
                return false;
            }
            return true;
        } else if (obj instanceof Location) {
            Location tmp = (Location) obj;
            if (tmp.isOtherScreen()!=remote) {
                //mismatch
                tmp.setOtherScreen(currentScreen);
                return false;
            }
            return true;
        }
        return true;
    }

/*
//May be OBE because of screen changes
    public Location createLocation(int x, int y) {
        log("Creating location "+x+", "+y);
        return new Location(x,y);
    }

    public Region createRegion(int x, int y, int w, int h) {
        log("Creating region "+w+","+h+" @ "+x+", "+y);
        Region r = currentScreen.newRegion(x,y,w,h);

        log("We are on remote screen "+remoteScreen);
        if (remoteScreen) {
            log("    Forcing region to remote");
            //This is a remote connection
            r.setOtherScreen();
        }
        
        return r;
    }

    public Match findImage(Region reg, String imgFile) {
        log("Searching region "+reg+" for image "+imgFile);
        Pattern p = createPattern(imgFile);
        return reg.exists(p);
    }

    public Match findPattern(String imagePath) throws FindFailed
    {
      Pattern p = createPattern(imagePath);
      return ((Region)currentScreen).find(p);
    }

    public String readText(Region r)
    {
      OCR reader = createReader();
      String tmp = reader.readText(r);
      log("Reading text "+tmp+" from "+r);
      return tmp;
    }

    public OCR createReader()
    {
        //OCR has options but are not usually of interest and are not 
        //dealt with here. More information at
        //https://sikulix-2014.readthedocs.io/en/latest/textandocr.html

        log("Creating optical character reader");
        return new OCR();
    }

*/
}