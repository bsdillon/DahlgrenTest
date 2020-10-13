
package JavaFXGui;

import javafx.application.*;
import javafx.event.*;
import javafx.event.EventHandler;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.*;
import javafx.scene.web.WebView;

public class App extends Application {

    @Override
    public void start(Stage rootStage) {

      AnchorPane root = new AnchorPane();

      WebView webView = new WebView();
      // jsprimary.html is on our CLASSPATH because build.gradle
      // has a sourcesets.main.resources block which adds ../html/Testing/
      // during build time.
      webView.getEngine().load(
        App.class.getResource("/jsprimary.html").toString()
      );
      
      AnchorPane.setTopAnchor(webView, 0.0);
      AnchorPane.setBottomAnchor(webView, 0.0);
      AnchorPane.setLeftAnchor(webView, 0.0);
      AnchorPane.setRightAnchor(webView, 0.0);
      root.getChildren().addAll(webView);


      Scene scene = new Scene(root, 600, 400);

      rootStage.setTitle("FX App GUI");
      rootStage.setScene(scene);
      rootStage.show();
    }

    public static void main(String... args) {
        launch(args);
    }
}
