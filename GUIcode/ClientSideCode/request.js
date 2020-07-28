const solution = function () {

    var request = new XMLHttpRequest()

    request.open('GET', 'http://localhost:1337/', true);
    request.setRequestHeader('math', 'number');

    request.onload = function () {
        alert(request.response);
    };

    request.send();
}

const test = function () {
    var request = new XMLHttpRequest()

    request.open('GET', 'http://localhost:1337/', true);
    request.setRequestHeader('hello', 'world');

    request.onload = function () {
        alert(request.response);
    };

    request.send();
}
