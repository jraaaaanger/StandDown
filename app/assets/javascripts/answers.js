function onQuestionSubmit() {
    var questionId;
    var userId;
    var answerBody;
    var path = '/api/questions/' + questionId + '/answers.json';
    var request = $.ajax({
      url: path,
      method: "POST",
      dataType: "json",
      data: {
        answer: {
          user_id: userId,
          body: answerBody
        }
      }
    });
    request.done(function(data) {
      alert('worked');
    })
  };
