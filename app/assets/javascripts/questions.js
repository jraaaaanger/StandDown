function questionSubmit() {
  event.preventDefault();

  var variables = event.target.id.split("-");
  var userId = variables[1];
  var questionId = variables[0];
  console.log(userId);

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

  response.done(function() {
    var newClass = "#answer-" + questionId;
    $(newClass).toggle("fast");
  });
}
