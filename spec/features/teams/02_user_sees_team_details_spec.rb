require 'rails_helper'

feature 'user sees team details' do
  context 'signed-in user' do
    let!(:team) { FactoryGirl.create(:team) }
    let!(:user) { FactoryGirl.create(:user, team: team) }
    let!(:answer) { FactoryGirl.create(:answer, user: user) }
    let!(:new_team) { FactoryGirl.create(:team, name: 'Ilvermorny', city: 'New York', state: 'NY',
                                         organization: team.organization, timezone: 'America/New_York') }
    let!(:new_user) { FactoryGirl.create(:user, first_name: 'Newt', last_name: 'Scamander',
                                         team: new_team) }
    let!(:new_answer) { FactoryGirl.create(:answer, user: new_user) }

    scenario 'user goes to all teams in organization and sees details' do
      login_as user
      visit root_path

      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'
      within('.team-wrapper') do
        click_link 'Ravenclaw'
      end

      expect(page).to have_content('Ravenclaw')
    end

    scenario 'user can multiple teams' do
      login_as new_user
      visit root_path
      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'

      expect(page).to have_content('Ilvermorny')
      expect(page).to have_content('New York, NY')
      expect(page).to have_content('Ravenclaw')
      expect(page).to have_content('Hogsmeade, Great Britain')
    end

    scenario 'user sees time difference on show pages' do
      login_as new_user
      visit root_path

      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'
      within('.team-wrapper') do
        click_link 'Ravenclaw'
      end

      expect(page).to have_content('Ravenclaw is 4 hours ahead of you.')
    end

    scenario 'user sees option to view users of a team', js: true do
      login_as new_user
      visit root_path

      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'
      click_link 'Ravenclaw'

      expect(page).to have_content('Users')
    end

    scenario 'user sees users after clicking users', js: true do
      login_as new_user
      visit root_path

      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'
      within('.team-wrapper') do
        click_link 'Ravenclaw'
      end
      click_link 'Users'

      expect(page).to have_content('Rubeus Hagrid')
    end

    scenario 'user does not see themselves on a team user list', js: true do
      login_as new_user
      visit root_path

      click_link 'Hogwarts'
      click_link 'All Teams in Hogwarts'
      click_link 'Ilvermorny'
      click_link 'Users'

      expect(page).to_not have_content('Newt Scamander')
    end
  end
end
