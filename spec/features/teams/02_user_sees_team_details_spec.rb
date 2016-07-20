require 'rails_helper'

feature 'user sees ' do
  context 'signed-in user' do
    let!(:team) { FactoryGirl.create(:team) }
    let!(:user) { FactoryGirl.create(:user, team: team) }
    let!(:new_team) { FactoryGirl.create(:team, name: 'Ilvermorny', city: 'New York', state: 'NY',
                                         organization: team.organization, timezone: 'America/New_York') }
    let!(:new_user) { FactoryGirl.create(:user, first_name: 'Newt', last_name: 'Scamander',
                                         team: new_team) }

    scenario 'user goes to all teams in organization and sees details' do
      login_as user
      visit root_path

      click_link 'All Teams in Hogwarts'
      click_link 'Ravenclaw | Hogsmeade, Great Britain'

      expect(page).to have_content('Ravenclaw')
    end

    scenario 'user can multiple teams' do
      login_as new_user
      visit root_path
      click_link 'All Teams in Hogwarts'

      expect(page).to have_content('Ilvermorny')
      expect(page).to have_content('New York, NY')
      expect(page).to have_content('Ravenclaw')
      expect(page).to have_content('Hogsmeade, Great Britain')
    end

    scenario 'user sees time difference on show pages' do
      login_as new_user
      visit root_path

      click_link 'All Teams in Hogwarts'
      click_link 'Ravenclaw | Hogsmeade, Great Britain'

      expect(page).to have_content('Ravenclaw is 5 hours ahead of you.')
    end

    scenario 'user sees list of users for a team' do
      login_as new_user
      visit root_path

      click_link 'All Teams in Hogwarts'
      click_link 'Ravenclaw | Hogsmeade, Great Britain'

      expect(page).to have_content('Users')
      expect(page).to have_content('Rubeus Hagrid')
    end

    scenario 'user does not see themselves on a team user list' do
      login_as new_user
      visit root_path

      click_link 'All Teams in Hogwarts'
      click_link 'Ilvermorny | New York, NY'

      expect(page).to_not have_content('Newt Scamander')
    end
  end
end
