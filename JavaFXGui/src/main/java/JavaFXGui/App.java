
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

      // as an embedded browser, we are responsible for handling a number of JS
      // functions like console.log(), alert(), and window.open.
      // See https://stackoverflow.com/questions/16370622/webview-not-opening-the-popup-window-in-javafx
      webView.getEngine().setCreatePopupHandler(popup_features -> {
        Stage stage = new Stage(StageStyle.UTILITY);
        WebView wv2 = new WebView();
        stage.setScene(new Scene(wv2));
        stage.show();
        return wv2.getEngine();
      });
      
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
