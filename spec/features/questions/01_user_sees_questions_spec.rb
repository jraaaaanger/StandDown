require 'rails_helper'

feature 'user sees questions that need to be answered' do
  context 'before signing in' do
    let!(:question) { create(:question) }
    scenario 'user does not see questions yet' do
      visit root_path

      expect(page).to_not have_content(question)
    end
  end

  context 'after signing in' do
    let!(:organization) { create(:organization) }
    let!(:team) { create(:team, organization: organization) }
    let!(:user) { create(:user, team: team) }
    let!(:question) { create(:question, organization: organization) }

    before(:each) do
      login_as user
      visit root_path
    end

    scenario 'user sees questions on the root path' do
        expect(page).to have_content(question.body)
    end

    scenario 'user clicks on question to answer it' do
      click_link question.body

      expect(page).to have_content(question.body)
      expect(page).to have_css('form')
      expect(page).to have_button('Submit')
    end
  end
end
