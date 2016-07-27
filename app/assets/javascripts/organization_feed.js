function liveTeamFeed(id) {
  var path = '/api/teams/' + id + '/answers.json';
  var $oldAnswerID = document.getElementById('hidden-id-'+ String(id)).innerHTML;

  var response = $.get(path, function(data) {
    $lastAnswer = data.answers[data.answers.length - 1];
    $lastID = $lastAnswer.id.toString();

    if ($lastID === $oldAnswerID) {
      setTimeout(liveFeed, 10000);
    }
    else {
      var identifier = 'hidden-id-' + String(id);
      document.getElementById(identifier).innerHTML = $lastID;
      showOrgAnswer($lastAnswer);
      setTimeout(liveTeamFeed, 10000);
      console.log('answer added')
    };
  }, "json")
}

function showOrgAnswer(newInfo) {
  $recentDiv = $('#org-answers');

  $responderTime = newInfo.time;
  $userLink = '<a href="mailto:' + newInfo.user.email + '">' + newInfo.user.name + '</a>';
  $userDiv = '<div class="left-section">' + $userLink + " | " + $responderTime + " there</div>";

  $questionBody = '<span class="team-question">'+ newInfo.body.question +'</span>';
  $answerBody = '<span class="team-answer">'+ newInfo.body.answer +'</span>'
  $answerDiv = '<div class="right-section">'+ $questionBody + $answerBody +'</div>';

  $fullDiv = '<div class="user-response" style="display:none">' + $userDiv + $answerDiv + '</div>';
  $recentDiv.prepend($fullDiv);
  $('#org-answers div:hidden').show(300);
}
