require 'rails_helper'

describe 'Organizations API' do

  let!(:org) { build(:organization) }
  let!(:team) { create(:team, organization: org) }
  let!(:user) { create(:user, team: team) }
  let!(:question) { create(:question, organization: org) }
  let!(:answer) { create(:answer, user: user, question: question) }

  describe 'GET api/organizations/:org_id/answers.json' do
    it 'successfully gets a response from the API controller' do
      get "/api/organizations/#{org.id}/answers.json", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
    end

    it 'returns all answers for the organization specified' do
      get "/api/organizations/#{org.id}/answers.json", {}, { 'Accept' => 'application/json' }

      body = JSON.parse(response.body)
      answer_body = body['answers'][0]
      user_body = answer_body['user']

      expect(body).to have_key 'answers'
      expect(answer_body).to have_key 'body'
      expect(answer_body['body']).to have_key 'question'
      expect(answer_body['body']).to have_key 'answer'

      expect(answer_body['id']).to eq answer.id
      expect(answer_body['time']).to eq answer.submitter_time
      expect(answer_body['body']['question']).to eq question.body
      expect(answer_body['body']['answer']).to eq answer.body

      expect(user_body).to have_key 'name'
      expect(user_body).to have_key 'email'

      expect(user_body['name']).to eq user.fullname
      expect(user_body['email']).to eq user.email
    end
  end
end
