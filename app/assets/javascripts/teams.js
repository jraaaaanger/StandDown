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
  $recentDiv = $('#recent-activity-appendable');
  $lastAdded = $($recentDiv).find('.user-response').last()[0];

  $toHide = $recentDiv.find('.user-response')[5];
  $responderTime = newInfo.time;
  $userLink = '<a href="mailto:' + newInfo.user.email + '">' + newInfo.user.name + '</a>';
  $userDiv = '<div class="left-section">' + $userLink + " | " + $responderTime + " there</div>";

  $questionBody = '<span class="team-question">'+ newInfo.body.question +'</span>';
  $answerBody = '<span class="team-answer">'+ newInfo.body.answer +'</span>'
  $answerDiv = '<div class="right-section">'+ $questionBody + $answerBody +'</div>';

  $fullDiv = '<div class="user-response">' + $userDiv + $answerDiv + '</div>';
  $recentDiv.prepend($fullDiv);
}

function liveFeed() {
  var teamID = $('#team-id').text();
  var path = '/api/teams/' + teamID + '/answers.json';
  var oldAnswerId;

  var response = $.get(path, function(data) {
    $lastAnswer = data.answers[data.answers.length - 1];
  
    showRecentAnswer($lastAnswer, oldAnswerId)
    setTimeout(liveFeed, 1000);
    console.log('done');
  }, "json")
}
