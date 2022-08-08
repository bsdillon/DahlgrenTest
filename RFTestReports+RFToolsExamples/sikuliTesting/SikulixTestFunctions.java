/***
 * Functions may need modification in order to be implemented, this just provides the basic idea of the function
 ***/
import org.sikuli.script.*;
import javax.imageio.ImageIO;
import java.io.*;
import java.awt.image.BufferedImage;

public class SikulixTestFunctions {


    //use main method to test functions as going
    public static void main(String[] args) throws FindFailed {
    
    }

    /**
     * Takes a screenshot of a region and saves it to the file path
     * @param region an element or a window to take a screenshot of
     * @param filepath path to save the screenshot to
     */
    public static void captureElement(Region region, String filepath){
        ScreenImage elementSC = region.getScreen().capture(region);
        try {
            BufferedImage screenShot = elementSC.getImage();
            File outputFile = new File(filepath);
            ImageIO.write(screenShot, "png", outputFile);
        }catch(IOException e){
            System.out.println("could not save image");
            System.out.println();
        }
    }

    /**
     * Captures the full screen the region is in and saves it to the filepath
     * @param region an element or window
     * @param filepath path to save the screenshot to
     */
    public static void Screenshot(Region region, String filepath){
        ScreenImage ScreenSC = region.getScreen().capture();
        try {
            BufferedImage screenShot = ScreenSC.getImage();
            File outputFile = new File(filepath);
            ImageIO.write(screenShot, "png", outputFile);
        }catch(IOException e){
            System.out.println("could not save image");
            System.out.println();
        }

    }

    /**
     * Locates an element on the screen and moves it to a new location
     * @param region a pattern object of the element to be moved
     * @param x the x-coordinate of the upper left hand corner of the new location
     * @param y the y-coordinate of the upper left hand corner of the new location
     * @throws FindFailed throws a find failed exception if the element can not be located on the screen
     */
    public static void moveWindow(Pattern region, int x, int y) throws FindFailed{
        //Sets screen object to the current monitor
        Screen screen = new Screen(0);
        Location newWindowLocation = new Location(x, y);
        //finds the clickPoint and moves it to the specified (x,y)
        try {
            Match match = screen.find(region);
            screen.dragDrop(match, newWindowLocation);
        }catch (FindFailed e ){
            System.out.println("Find failed on "+ region.toString());
        }
    }

    /**
     * Finds a textbox and enters text in it
     * @param region the area of the text box
     * @param text the text to be entered into the text box
     * @throws FindFailed throws error if the text box cannot be found
     */
    public static void enterText(Pattern region, String text) throws FindFailed{
        Screen s = new Screen(0);
        try{
            s.find(region).type(text);
        }catch(FindFailed e){
            System.out.println("Find failed on " + region.toString());
        }
    }

    /**
     * Finds an element on the screen and clicks it
     * @param region a pattern object, of the element to be clicked
     * @throws FindFailed throws a find failed exception if the element can not be located on the screen
     */
    public static void click(Pattern region) throws FindFailed{
        Screen s = new Screen(0);
        try{
            s.find(region).click();
        }catch (FindFailed e){
            System.out.println("Find failed on " + region.toString());
        }
    }

    /**
     * Finds an element on the screen and preforms a double click
     * @param region a pattern object of the element to be clicked
     * @throws FindFailed throws a find failed exception if the element can not be found on the screen
     */
    public static void doubleClick(Pattern region) throws FindFailed{
        Screen s = new Screen(0);
        try{
            s.find(region).doubleClick();
        }catch (FindFailed e){
            System.out.println("Find failed on " + region.toString());
        }
    }
}

