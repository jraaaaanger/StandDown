require 'rails_helper'

feature 'user sees stats after logging in' do
  context 'while signed-in' do
    let!(:organization) { create(:organization) }
    let!(:team) { create(:team) }

    before :each do
      user = create(:user)
      login_as user
      visit root_path
    end

    scenario 'visits home and sees user data' do
      expect(page).to have_content('Hello, Rubeus Hagrid.')
      expect(page).to have_content('Current Team: Ravenclaw')
      expect(page).to have_content('Current Location: Hogsmeade, Great Britain')
    end

    scenario 'sees link to change current team' do
      expect(page).to have_link('Change')
      click_link 'Change'

      expect(page).to have_css('form')
      expect(page).to have_css('#user_team_id')
    end

    scenario 'sees link with all organization teams' do
      click_link 'All Teams in Hogwarts'

      expect(page).to have_content(team.name)
      expect(page).to have_content(team.location)
    end
  end
end
