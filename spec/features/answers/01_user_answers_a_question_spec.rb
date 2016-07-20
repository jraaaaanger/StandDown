require 'rails_helper'

feature 'user can answer a question' do
  context 'after signing in' do
    let!(:organization) { create(:organization) }
    let!(:team) { create(:team, organization: organization) }
    let!(:user) { create(:user, team: team) }
    let!(:question) { create(:question, organization: organization) }

    before(:each) do
      login_as user
      visit root_path
    end
    scenario 'user finds a form to answer a question' do
      click_link question.body

      expect(page).to have_css 'form'
      expect(page).to have_content question.body
    end

    scenario 'user can answer a question' do
      click_link question.body

      fill_in 'Response', with: 'They are the same plant, which also goes by the name aconite.'
      click_button 'Submit'

      expect(page).to have_current_path(root_path)
    end

    scenario 'question no longer appears after it is answered' do
      click_link question.body

      fill_in 'Response', with: 'They are the same plant, which also goes by the name aconite.'
      click_button 'Submit'

      expect(page).to_not have_content question.body
    end

  end
end
