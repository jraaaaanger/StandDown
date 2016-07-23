json.answers @answers do |a|
  json.id a.id
  json.time a.submitter_time
  json.body do
    json.question a.question.body
    json.answer a.body
  end
  json.user do
    json.name a.user.fullname
    json.email a.user.email
  end
end
