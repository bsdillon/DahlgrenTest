var updateTopicsButton = document.getElementById("updateTopics");
var recordButton = document.getElementById("record");
var logButton = document.getElementById("logEvent");
var pauseButton = document.getElementById("pause");
var stopButton = document.getElementById("stop");
var clearDataButton = document.getElementById("clearData");
var errorButton = document.getElementById("error");
var finishButton = document.getElementById("finish");

function onWebsocketMessage(message){
    console.log("Message from the server: " + message);

    if(message.startsWith("disable")){
        var mes = message.split(":");
        var btnsToDisable;

        if(mes.length > 2){
            for(var i = 1; i < mes.length; i++){
                btnsToDisable = mes[i];
                disableButtons(btnsToDisable);
            }
        }else{
            btnsToDisable = mes[1];
            disableButtons(btnsToDisable);
        }

        /*for(var i = 0; i < btnsToDisable.length; i++){
            disableButtons(btnsToDisable[i]);
        }*/
    }
}

function disableButtons(btnName){
    //console.log(btnName);
    document.getElementById(btnName).innerHTML.disabled = "true";
}

function updateTopicsPressed(){
    //updateTopicsButton.disabled = "true";
    //disableButtons(updateTopicsButton);
    //emits a signal containing topic names

    //calls UpdateLastExperimentFile()
    //sets topicsSent bool to true
    //calls CheckState()
    websocket.send("ep:updateTopicsPressed");
}

function recordPressed(){
    //set state to running
    //calls ApplyState()
    websocket.send("ep:recordPressed");
}

function pausePressed(){
    //set state to paused
    //calls ApplyState()
    websocket.send("ep:pausePressed");
}

function stopPressed(){
    //if dataReceived is true, set state to ClearingData
    //else, set state to Finalizing
    //calls ApplyState()
    websocket.send("ep:stopPressed");
}

function errorPressed(){
    websocket.send("ep:errorPressed");
}

function finishPressed(){
    websocket.send("ep:finishPressed");
}

function clearDataPressed(){
    websocket.send("ep:clearDataPressed");
}

function logEventPressed(){
    websocket.send("ep:logEventPressed");
}
