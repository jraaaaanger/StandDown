function liveTeamFeed(id) {
  $id = id;
  closure();

  function getAnswerIDs() {
    $oldAnswerID = document.getElementById('hidden-team-answer-id-'+ String($id)).innerHTML;
  };

  function getLastAnswerIDs(data) {
    $lastAnswer = data.answers[data.answers.length - 1];
    if ($lastAnswer) {
      $lastID = $lastAnswer.id.toString();
    } else {
      $lastID = '0';
    };
  };

  function closure() {
    var response = $.get('/api/teams/' + $id + '/answers.json', function(data) {
      getAnswerIDs();
      getLastAnswerIDs(data);

      if ($lastID === $oldAnswerID || $lastID === '0') {
        setTimeout(closure, 2000);
        console.log('no answer added to team');
      }
      else {
        var identifier = 'hidden-team-answer-id-' + String(id);
        document.getElementById(identifier).innerHTML = $lastID;
        console.log('answer added to team');
        showOrgTeamAnswer($lastAnswer, $id);
        setTimeout(closure, 2000);
      };
    }, "json")
  };
}

function showOrgTeamAnswer(newInfo, id) {
  $groupID = '#org-team-' + String(id);
  $groupHidden = $groupID + ' div:hidden';
  $recentDiv = $($groupID);

  $responderTime = newInfo.time;
  $userLink = '<a href="mailto:' + newInfo.user.email + '">' + newInfo.user.name + '</a>';
  $userDiv = '<div class="left-section">' + $userLink + " | " + $responderTime + " there</div>";

  $questionBody = '<span class="team-question">'+ newInfo.body.question +'</span>';
  $answerBody = '<span class="team-answer">'+ newInfo.body.answer +'</span>'
  $answerDiv = '<div class="right-section">'+ $questionBody + $answerBody +'</div>';

  $fullDiv = '<div class="user-response" style="display:none">' + $userDiv + $answerDiv + '</div>';
  $recentDiv.prepend($fullDiv);
  $($groupID + 'div:hidden').show(300);
}
