function getTeams() {
  event.preventDefault();
  $organizationID = $('#org-id')[0].innerHTML;
  $userID = $('#team-id').innerHTML;
  $path = "/api/users/" + $userID;
  $toUpdate = $('#team-title');

  var response = $.get('/api/organizations/'+ $organizationID + '/teams.json',
   function(data) {
     $toUpdate.innerHTML = "";
     $newSelect = "";
     $.each(data, function(k, v) {
       $newSelect = $newSelect + '<option value="' + v.id + '">' + v.name + '</option>'
      });
      $newField = '<select class="new-team">' + $newSelect + '</select>';
      $newField = $newField + '<a href="#" onClick="changeTeam()" class="button postfix">Change</a><br />';
      $toUpdate.replaceWith($newField)
 	});
}

function changeTeam() {
  $newTeamID = $('.new-team').val();
  $userID = $('#team-id').innerHTML;
  $path = "/api/users/" + $userID;

}
