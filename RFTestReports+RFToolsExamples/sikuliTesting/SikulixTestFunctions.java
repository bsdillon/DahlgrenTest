/***
 * This is a test program creating functions with sikulix that can be implemented in future RF projects
 * Functions may need modification inorder to be implemented, this just provides the basic idea of the function
 * Matthew Rose (V51)
 * Work in progress, Last updated (7/26/22)
 */
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
    public static void captureScreen(Region region, String filepath){
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
     * Finds an element based on a pre-existing image file
     * @param filepath path of the image you want to find
     * @return a match object to be used in fuctions such as click, capture, etc
     * @throws FindFailed if the match can not be found, meaning the path was incorrect
     */
    public static Match findElement(String filepath) throws FindFailed{
        Screen screen = new Screen(0);
        try {
            return screen.find(filepath);
        }catch(FindFailed e){
            System.out.println();
        }
        return null;
    }





    /*public static void moveWindow(Region region, String FilePath, int x, int y) throws FindFailed{
        //Sets screen object to the current monitor
        Screen screen = new Screen(0);
        Location newWindowLocation = new Location(x, y);
        //finds the clickPoint and moves it to the specified (x,y)
        screen.dragDrop(screen.find(region), newWindowLocation);
    }*/
}
