import py4j.GatewayServer;
import org.sikuli.script.*;
import org.sikuli.vnc.*;
import java.util.*;

public class SikuliEntryPoint {
    private Map<String, Screen> screens = new HashMap<String, Screen>();
    private Map<String, VNCScreen> vnc_screens = new HashMap<String, VNCScreen>();

    public SikuliEntryPoint() {
    }

    public static void main(String[] args) {
        GatewayServer gatewayServer = new GatewayServer(new SikuliEntryPoint());
        gatewayServer.start();
        System.out.println("Gateway Server Started");
    }

    public Screen getScreen() {
        System.out.println("Accessed screen w/o id");
        if(!screens.containsKey(""))
        {
          screens.put("",new Screen());
        }
        return screens.get("");
    }

    public Screen getScreen(int id) {
        System.out.println("Accessed screen w/id");
        if(!screens.containsKey(""+id))
        {
          screens.put(""+id,new Screen(id));
        }
        return screens.get(""+id);
    }

    public VNCScreen getScreen(String ip, int port) {
        String vnc = ip+":"+port;
        System.out.println("Accessed vnc screen");
        if(!vnc_screens.containsKey(vnc))
        {
          vnc_screens.put(vnc, VNCScreen.start(ip, port,10,1000));
        }
        return vnc_screens.get(vnc);
    }

    public Location getLocation(int x, int y) {
        System.out.println("Accessed location");
        return new Location(x,y);
    }

    public Region getRegion(int x, int y, int w, int h) {
        System.out.println("Accessed region");
        return new Region(x,y,w,h);
    }
}