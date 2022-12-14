import py4j.GatewayServer;
import org.sikuli.script.*;
import org.sikuli.vnc.*;
import java.io.*;
import java.util.*;

public class SikuliEntryPoint {
    private Map<String, Screen> screens = new HashMap<String, Screen>();
    private Map<String, VNCScreen> vnc_screens = new HashMap<String, VNCScreen>();

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

    public Screen getScreen() {
        log("Accessed screen w/o id");
        if(!screens.containsKey(""))
        {
          screens.put("",new Screen());
        }
        return screens.get("");
    }

    public Screen getScreen(int id) {
        log("Accessed screen w/id");
        if(!screens.containsKey(""+id))
        {
          screens.put(""+id,new Screen(id));
        }
        return screens.get(""+id);
    }

    public VNCScreen getScreen(String ip, int port) {
        log("Accessed screen @ "+ip+":"+port);
        String vnc = ip+":"+port;
        if(!vnc_screens.containsKey(vnc))
        {
          vnc_screens.put(vnc, VNCScreen.start(ip, port,10,1000));
        }
        return vnc_screens.get(vnc);
    }

    public Location createLocation(int x, int y) {
        log("Creating location "+x+", "+y);
        return new Location(x,y);
    }

    public Region createRegion(int x, int y, int w, int h) {
        log("Creating region "+w+","+h+" @ "+x+", "+y);
        return new Region(x,y,w,h);
    }

    public Match findPattern(String imagePath, int screenID) throws FindFailed
    {
      Pattern p = createPattern(imagePath);
      Screen s = getScreen(screenID);
      return s.find(p);
    }

    public Pattern createPattern(String imagePath)
    {
        log("Creating pattern from "+imagePath);
        return new Pattern(imagePath);
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
}