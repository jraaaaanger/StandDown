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
