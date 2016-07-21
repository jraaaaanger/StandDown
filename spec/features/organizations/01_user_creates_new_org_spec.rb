require 'rails_helper'

feature 'user makes a new organization' do
  context 'as an unauthenticated user' do
    scenario 'visits home page and does not see new org button' do
      visit root_path

      expect(page).to_not have_link('New Organization')
    end
  end

  context 'as an authenticated user' do
    let!(:team) { create(:team) }
    let!(:organization) { create(:organization) }

    before(:each) do
      user = create(:user)
      login_as user
      visit root_path
    end

    scenario 'visits home page and sees new org button' do
      expect(page).to have_link(organization.name)
    end

    scenario 'user clicks new organization and sees a form' do
      click_link organization.name
      click_link 'New Organization'

      expect(page).to have_content('Create an Organization')
      expect(page).to have_css('form')
    end

    scenario 'submits new organization form correctly' do
      click_link organization.name
      click_link 'New Organization'
      fill_in 'Name', with: 'Ministry of Magic'
      fill_in 'Standup Time', with: '10:00 am'
      fill_in 'Description', with: 'Magic is Might'
      click_button 'Create'

      expect(page).to have_content 'Ministry of Magic'
      expect(page).to have_content 'Added!'
    end

    scenario 'submits new organization form incorrectly' do
      click_link organization.name
      click_link 'New Organization'
      fill_in 'Description', with: 'Cornelius Fudge, Minister of Magic'
      fill_in 'Standup Time', with: '10'
      click_button 'Create'

      expect(page).to have_css('form')
      expect(page).to have_content('Please try again')
    end
  end
end
