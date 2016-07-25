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

  $responderTime = newInfo.time;
  $userLink = '<a href="mailto:' + newInfo.user.email + '">' + newInfo.user.name + '</a>';
  $userDiv = '<div class="left-section">' + $userLink + " | " + $responderTime + " there</div>";

  $questionBody = '<span class="team-question">'+ newInfo.body.question +'</span>';
  $answerBody = '<span class="team-answer">'+ newInfo.body.answer +'</span>'
  $answerDiv = '<div class="right-section">'+ $questionBody + $answerBody +'</div>';

  $fullDiv = '<div class="user-response" style="display:none">' + $userDiv + $answerDiv + '</div>';
  $recentDiv.prepend($fullDiv);
  $('#recent-activity-appendable div:hidden').show(300);
}

function liveFeed() {
  var teamID = $('#team-id').text();
  var path = '/api/teams/' + teamID + '/answers.json';
  var $oldAnswerID = document.getElementById('hidden-id').innerHTML;

  var response = $.get(path, function(data) {
    $lastAnswer = data.answers[data.answers.length - 1];
    $lastID = $lastAnswer.id.toString();

    if ($lastID === $oldAnswerID) {
      setTimeout(liveFeed, 1000);
    }
    else {
      document.getElementById('hidden-id').innerHTML = $lastID;
      showRecentAnswer($lastAnswer)
      setTimeout(liveFeed, 1000);
      console.log('answer added')
    };
  }, "json")
}
