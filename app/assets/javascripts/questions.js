function questionSubmit() {
  event.preventDefault();

  var variables = event.target.id.split(" ");
  var userId = variables[1];
  var questionId = variables[0];

  answerBody = $("#" + questionId + "-value").val();

  var response = $.ajax({
  method: "POST",
  url: "/api/questions/" + questionId + "/answers",
  data: {
   answer: {
     user_id: userId,
     body: answerBody
   }
  }
  });
  
  request.done(function(data) {
    var newClass = "#answer-" + questionId;
    $(newClass).toggle("fast");
  });
}
