require 'rails_helper'

describe 'Teams API' do
  describe 'GET api/organizations/:organization_id/teams.json' do
    it 'successfully gets a response from the API controller' do
      org = FactoryGirl.create :organization
      team = FactoryGirl.create :team, organization: org

      get "/api/organizations/#{org.id}/teams.json", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
    end

    it 'successfully gets a json list of all teams/info' do
      org = FactoryGirl.create :organization
      team = FactoryGirl.create :team, organization: org

      get "/api/organizations/#{org.id}/teams.json", {}, { 'Accept' => 'application/json' }

      body = JSON.parse(response.body)[0]

      expect(body['id']).to eq team.id
      expect(body['name']).to eq team.name
      expect(body['description']).to eq team.description
      expect(body['timezone']).to eq team.timezone
      expect(body['city']).to eq team.city
      expect(body['state']).to eq team.state
      expect(body['country']).to eq team.country
      expect(body['organization_id']).to eq org.id
    end
  end
end
