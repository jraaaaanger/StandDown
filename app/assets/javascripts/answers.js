function formOpen() {
  event.preventDefault();
  var newClass = "#answer-" + event.target.id;
  $(newClass).toggle("fast");
};

function loadAnswer() {
  var variables = event.target.id.split("-");
  var userId = variables[1];
  var questionId = variables[0];
  var $answerDiv = $(".response-" + questionId); 
  var response = $.ajax({
  method: "GET",
  url: "/api/users/" + userId + "/questions/"+ questionId +"/answers",
  success: function(data) {

  }
  });

}
