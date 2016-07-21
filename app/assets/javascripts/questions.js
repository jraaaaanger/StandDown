function questionSubmit() {
  event.preventDefault();

  var variables = event.target.id.split("-");
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

  response.done(function() {
    var newClass = "#answer-" + questionId;
    $(newClass).toggle("fast");
    var $answerDiv = $("#response-" + questionId);
    var $newContent = "<h5>"+ answerBody + "</h5>";
    $answerDiv.append($newContent);
    $answerDiv.toggle();
    $(newClass).remove();
  });
}
