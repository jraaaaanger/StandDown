function userTime() {
    var zone = $('#user-time-zone')[0].innerHTML;
    var now = moment.tz(zone);
    var h = now.hours();
    var m = checkTime(now.minutes());
    $('#user-time')[0].innerHTML = h + ":" + m;
    setTimeout(userTime, 5000);
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
