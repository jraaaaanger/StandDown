function formOpen() {
  event.preventDefault();
  var newClass = "#answer-" + event.target.id;
  $(newClass).toggle("fast");
};
