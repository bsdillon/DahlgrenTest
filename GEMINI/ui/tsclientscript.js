//Fields
var saveTopicsButton = document.getElementById("saveTopicList");
var modal = document.getElementById("topicSelectorModal");
var saveModal = document.getElementById("saveFileModal");
var topicSpan = document.getElementById("topic-span");
var saveSpan = document.getElementById("save-span");
var displayPanel = document.getElementById("panel1-p");
var lsPanel = document.getElementById("panel2-p");
var topicNames;

function onWebsocketMessage(message){
    console.log("Message from the server: " + message);

    if(message.startsWith("filenames:")){
        //displays save file names on the load modal
        document.getElementById("modalText").innerHTML = displayInput(message, "radio", "file");
    }else if(message.startsWith("topicnames")){
        //displays the topics retreived from GEMINI in the display panel upon connecting to the websocket
        document.getElementById("panel1-p").innerHTML = displayInput(message, "checkbox", "topicp1");
        topicNames = message.split(":");
        checkSaveTopicsButton();
    }else if(message.startsWith("topicstomove")){
        //moves topics loaded in a save file
        moveLoadedTopics(message);
    }else if(message == "connected!"){
        getTopics();
    }else if(message == "empty!"){
        //the directory of save files is empty
        console.log("Directory is empty!");
    }
}

function checkSaveTopicsButton(){
    if (document.getElementById("panel2-p").innerHTML.includes("label")){
        saveTopicsButton.disabled = false;
    }else{
        saveTopicsButton.disabled = true;
    }
}

function moveTopics(selectedValue, unselectedValue, moveFrom, moveTo, moveToMes){
    var moveFromMes = "";
    var moveToMes = moveToMes;

   if(selectedValue.length > 0){
        for(var i = 0; i < selectedValue.length; i++){
            moveToMes = moveToMes + '<label for="' + selectedValue[i] + '">' + selectedValue[i] + '</label>' + "\n";
            moveToMes = moveToMes + '<input type="checkbox" name="' + moveTo + '" id="' + selectedValue[i] + '" value="' + selectedValue[i] + '"><br>' + "\n";
        }
        selectionChanged(selectedValue);
    }else {
        console.log("No topics to move");
    }

    if(unselectedValue.length > 0){
        for(var i = 0; i < unselectedValue.length; i++){
            moveFromMes = moveFromMes + '<label for="' + unselectedValue[i] + '">' + unselectedValue[i] + '</label>' + "\n";
            moveFromMes = moveFromMes + '<input type="checkbox" name="' + moveFrom + '" id="' + unselectedValue[i] + '" value="' + unselectedValue[i] + '"><br>' + "\n";
        }
    }else {
        //all topics moved
    }

    if(moveFrom == "topicp1"){
        document.getElementById("panel1-p").innerHTML = moveFromMes;
    }else if(moveFrom == "topicp2"){
        document.getElementById("panel2-p").innerHTML = moveFromMes;
    }else{
        console.log("moveTopics(): Move from panel fail");
    }

    if(moveTo == "topicp1"){
        document.getElementById("panel1-p").innerHTML = moveToMes;
    }else if(moveTo == "topicp2"){
        document.getElementById("panel2-p").innerHTML = moveToMes;
    }else{
        console.log("moveTopics(): Move to panel fail");
    }

    checkSaveTopicsButton();
}

function selectionChanged(selectedTopics){
    var topicSelection = "selectionChanged";
    for(var i = 0; i < selectedTopics.length; i++){
        topicSelection = topicSelection + ":" + selectedTopics[i];
    }
    websocket.send(topicSelection);
}

//Functions having to do with modal popups
function openModal(modalName){
    modalName.style.display = "block";
}

function closeModal(modalName){
    modalName.style.display = "none";
}

topicSpan.onclick = function(){
    closeModal(modal);
}

saveSpan.onclick = function(){
    closeModal(saveModal);
}

window.onclick = function(event){
    if (event.target == modal){
        closeModal(modal);
    }else if (event.target == saveModal){
        closeModal(saveModal);
    }
}

//Functions connected to buttons
function getTopics(){
    websocket.send("Function:getTopics");
}

function requestSaveFiles(){
    websocket.send("Function:requestSavedTopicLists");
    openModal(modal);
}

function loadFile(){
    const rbs = document.querySelectorAll('input[name="file"]');
    let selectedValue;

    for(const rb of rbs){
        if(rb.checked){
            selectedValue = rb.value;
            break;
        }
    }
    websocket.send("loadSaveFile:" + selectedValue);
    closeModal(modal);
}

function selectTopic(){
    const rbs = document.querySelectorAll('input[name="topicp1"]');
    const selectedValue = new Array();
    const unselectedValue = new Array();

    for(const rb of rbs){
        if(rb.checked){
            selectedValue.push(rb.value);
        }else {
            unselectedValue.push(rb.value);
        }
    }

    moveTopics(selectedValue, unselectedValue, "topicp1", "topicp2", document.getElementById("panel2-p").innerHTML);
}


function deselectTopic(){
    const rbs = document.querySelectorAll('input[name="topicp2"]');
    const selectedValue = new Array();
    const unselectedValue = new Array();

    for(const rb of rbs){
        if(rb.checked){
            selectedValue.push(rb.value);
        }else {
            unselectedValue.push(rb.value);
        }
    }

    moveTopics(selectedValue, unselectedValue, "topicp2", "topicp1", document.getElementById("panel1-p").innerHTML);
}


function saveTopicFile(){
    var mesToSend = "";
    const fileName = document.querySelector('input[name="saveFileName"]');
    mesToSend = fileName.value;

    const rbs = document.querySelectorAll('input[name="topicp2"]');
    for(const rb of rbs){
        mesToSend = mesToSend + ":" + rb.value;
    }
    websocket.send("saveTopics:" + mesToSend);
    closeModal(saveModal);
}

//onMessage functionalities
function displayInput(message, inputType, inputName){
    var inputNames = message.split(":");
    var displayMes = "";

    if (inputNames.length > 1){
        for (var i = 1; i < inputNames.length; i++){
            displayMes = displayMes + '<label for="' + inputNames[i] + '">' + inputNames[i] + '</label>' + "\n";
            displayMes = displayMes + '<input type="' + inputType + '" name="' + inputName + '" id="' + inputNames[i] + '" value="' + inputNames[i] + '"><br>' + "\n";
        }
    }

    return displayMes;
}

function moveLoadedTopics(topicsToMove){
    var movingTopics = topicsToMove.split(":");
    var selectedTopics = new Array();
    var unselectedTopics = new Array();

    for(var i = 1; i < topicNames.length; i++){
        if (movingTopics.includes(topicNames[i])){
            selectedTopics.push(topicNames[i]);
        }else {
            unselectedTopics.push(topicNames[i]);
        }
    }

    moveTopics(selectedTopics, unselectedTopics, "topicp1", "topicp2", "");
}
