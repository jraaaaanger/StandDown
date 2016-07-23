function showRA() {
  event.preventDefault();
  $('#recent-activity').show(400);
  $('#users').hide(400);
};

function showUsers() {
  event.preventDefault();
  $('#users').show(400);
  $('#recent-activity').hide(400);
}

function showRecentAnswer(newInfo) {
  $recentDiv = $('#recent-activity');
  $recentDiv.append($userName);
}

function liveFeed() {
  var teamID = $('#team-id').text();
  var path = '/api/teams/' + teamID + '/answers.json';

  var response = $.get(path, function(data) {
    $lastAnswer = data[data.length - 1];
    showRecentAnswer($lastAnswer);
  }, "json")
}
