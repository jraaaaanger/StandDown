json.answers @answers do |a|
  json.id a.id
  json.submitter_time a.submitter_time
  json.utc a.updated_at
  json.body do
    json.question a.question.body
    json.answer a.body
  end
  json.user do
    json.name a.user.fullname
    json.email a.user.email
  end
end
