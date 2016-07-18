require 'rails_helper'

feature 'user signs out' do

  scenario 'An authenticated user is able to sign out'  do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link('Sign Out')

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_link('Sign In')
  end
end
