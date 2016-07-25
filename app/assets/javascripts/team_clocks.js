function userTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    $('user-time')[0].innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}

function teamTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    $('team-time')[0].innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
