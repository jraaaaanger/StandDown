require 'rails_helper'
context 'as an authenticated user' do
  let!(:organization) { create(:organization) }
  let!(:team) { create(:team, organization: organization) }
  let!(:question) { create(:question, organization: organization) }
  let!(:new_question) { create(:question, organization: organization, body: 'How are you?') }
  let!(:user) { create(:user, team: team) }
  let!(:new_team) { create(:team, organization: organization, name: 'Gryffindor') }
  let!(:answer) { create(:answer, question: question, user: user) }
  before(:each) do
    login_as user
    visit root_path
  end

  scenario 'user sees organization answers live feed on home' do

    expect(page).to have_content('Recent Activity')
    expect(page).to have_content(answer.body)
  end

  scenario 'user sees recent activity live update without reload', js: true do
    click_link new_question.body
    fill_in 'answer', with: 'I am fine'
    click_link 'Answer'

    expect(page).to have_content('I am fine')
  end

  scenario 'user sees all teams and answers on org page' do
    click_link organization.name

    expect(page).to have_content(team.name)
    expect(page).to have_content(new_team.name)
  end

  scenario 'user sees answers from all teams on org page', js: true do
    click_link organization.name
    click_link 'All Teams'

    expect(page).to have_link 'Answers by Team'
    expect(page).to have_content answer.body
    expect(page).to have_content user.fullname
  end
end
