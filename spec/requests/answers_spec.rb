require 'rails_helper'

describe 'Answers API' do
  describe 'GET /api/teams/:team_id/answers' do
    it 'successfully gets a response from the API controller' do
      team = FactoryGirl.create :team
      user = FactoryGirl.create :user, team: team
      FactoryGirl.create :answer, user: user

      get "/api/teams/#{team.id}/answers.json", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
    end

    it 'returns JSON answers in configuration' do
      team = FactoryGirl.create :team
      user = FactoryGirl.create :user, team: team
      FactoryGirl.create :answer, user: user

      get "/api/teams/#{team.id}/answers.json", {}, { 'Accept' => 'application/json' }

      json_response = JSON.parse(response.body)
      answers = json_response['answers']
      user_hash = answers[0]['user']
      body = answers[0]['body']

      expect(json_response).to have_key 'answers'

      expect(answers[0]).to have_key 'body'
      expect(answers[0]).to have_key 'time'
      expect(answers[0]).to have_key 'user'

      expect(user_hash).to have_key 'name'
      expect(user_hash).to have_key 'email'

      expect(body).to have_key 'question'
      expect(body).to have_key 'answer'
    end

    it 'returns json with answer information' do
      team = FactoryGirl.create :team
      user = FactoryGirl.create :user, team: team
      answer = FactoryGirl.create :answer, user: user

      get "/api/teams/#{team.id}/answers.json", {}, { 'Accept' => 'application/json' }

      json_response = JSON.parse(response.body)
      answers = json_response['answers']
      user_hash = answers[0]['user']
      body = answers[0]['body']

      expect(answers[0]['time']).to eq(answer.submitter_time)
      expect(answers[0]['id']).to eq(answer.id)

      expect(body['question']).to eq answer.question.body
      expect(body['answer']).to eq answer.body

      expect(user_hash['name']).to eq user.fullname
      expect(user_hash['email']).to eq user.email
    end
  end
end
