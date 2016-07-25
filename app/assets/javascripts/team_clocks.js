function userTime() {
    var now = moment();
    var h = now.hours();
    var m = checkTime(now.minutes());
    var s = checkTime(now.seconds());
    $('#user-time')[0].innerHTML = h + ":" + m + ":" + s;
    setTimeout(userTime, 500);
}

function teamTime() {
    $timezone = $('#team-zone')[0].innerHTML;
    var now = moment.tz($timezone);
    var h = now.hours();
    var m = checkTime(now.minutes());
    var s = checkTime(now.seconds());
    $('#team-time')[0].innerHTML = h + ":" + m + ":" + s;
    setTimeout(teamTime, 500);
}

function checkTime(i) {
    if (i < 10) {i = "0" + i};
    return i;
}
