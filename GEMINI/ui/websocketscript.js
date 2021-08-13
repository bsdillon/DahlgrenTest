var wsUri = "ws://localhost:1337";
var websocket = null;

function startSocket(){
    try{
        if(websocket && websocket.readyState == 1){
            websocket.close();
        }

        websocket = new WebSocket(wsUri);

        websocket.onopen = function(evt){
            console.log("Connected");
            document.getElementById("websocketStatus").innerHTML = "Connected";
        }

        websocket.onclose = function(evt){
            console.log("Disconnected");
            document.getElementById("websocketStatus").innerHTML = "Disconnected";
            //modal.style.display = "none";
        }

        websocket.onerror = function(evt){
            console.log('Error: ' + evt.data);
            document.getElementById("websocketStatus").innerHTML = "Error: " + evt.data;
        }

        websocket.onmessage = function(event){
            var message = event.data;
            onWebsocketMessage(message);
        }
    } catch (exception){
        console.log('Error: ' + exception);
    }
}

function stopSocket(){
    if(websocket){
        websocket.close();
    }
}

function checkSocket(){
    if (websocket != null){
        var stateStr;
        switch (websocket.readyState) {
            case 0: {
                stateStr = "Connecting";
                break;
            }
            case 1: {
                stateStr = "Open";
                break;
            }
            case 2: {
                stateStr = "Closing";
                break;
            }
            case 3: {
                stateStr = "Closed";
                break;
            }
            case 4: {
                stateStr = "Unknown";
                break;
            }
        }

        console.log("WebSocket state = " + websocket.readyState + "("+ stateStr +")");
        document.getElementById("websocketStatus").innerHTML = "WebSocket state = " + websocket.readyState + "("+ stateStr +")";
    } else {
        console.log("Websocket state = Null");
        document.getElementById("websocketStatus").innerHTML = "Websocket state = Null";
    }
}
