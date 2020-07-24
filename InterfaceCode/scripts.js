const solution = function () {

    var request = new XMLHttpRequest()

    request.open('GET', 'http://192.168.86.32:1337', true)

    request.onload = function () {
        alert(request.response);
    }

    request.send()
}
