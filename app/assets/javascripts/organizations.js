function showRecentOrgAnswer(newInfo) {
  $recentDiv = $('#org-activity-appendable');

  $responderTime = newInfo.time;
  $userLink = '<a href="mailto:' + newInfo.user.email + '">' + newInfo.user.name + '</a>';
  $userDiv = '<div class="left-section">' + $userLink + " | " + $responderTime + " there</div>";

  $questionBody = '<span class="team-question">'+ newInfo.body.question +'</span>';
  $answerBody = '<span class="team-answer">'+ newInfo.body.answer +'</span>'
  $answerDiv = '<div class="right-section">'+ $questionBody + $answerBody +'</div>';

  $fullDiv = '<div class="user-response" style="display:none">' + $userDiv + $answerDiv + '</div>';
  $recentDiv.prepend($fullDiv);
  $('#org-activity-appendable div:hidden').show(300);
}

function liveOrgFeed() {
  var orgID = $('#org-id').text();
  var path = '/api/organizations/' + orgID + '/answers.json';
  var $oldAnswerID = document.getElementById('hidden-id').innerHTML;
  var response = $.get(path, function(data) {
    $lastAnswer = data.answers[data.answers.length - 1];
    $lastID = $lastAnswer.id.toString();

    if ($lastID === $oldAnswerID) {
      console.log('no answer added')
      setTimeout(liveOrgFeed, 1000);
    }
    else {
      document.getElementById('hidden-id').innerHTML = $lastID;
      showRecentOrgAnswer($lastAnswer)
      setTimeout(liveOrgFeed, 1000);
      console.log('answer added')
    };
  }, "json")
}

function toSpecific() {
  event.preventDefault();
  $('#all-teams').hide();
  $('#specific-teams').show()
}

function toAll() {
  event.preventDefault();
  $('#all-teams').show();
  $('#specific-teams').hide()
}
