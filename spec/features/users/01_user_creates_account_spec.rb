require 'rails_helper'

feature 'user creates an account' do
  context 'as a prospective user' do
    let!(:organization) { create(:organization) }
    let!(:team) { create(:team) }
    before(:each) do
      visit root_path
      click_link('Sign Up')
    end

    scenario 'I can visit the root path and click a link to create a new
      account' do
      expect(page).to have_css('form#new_user')
    end

    scenario 'I can click a link to create a new account and is taken to the
      new user form' do
      expect(page).to have_css('input#user_first_name')
      expect(page).to have_css('input#user_last_name')
      expect(page).to have_css('input#user_email')
      expect(page).to have_css('input#user_password')
      expect(page).to have_css('input#user_password_confirmation')
    end

    scenario 'I will successfully create an account by filling out the form
      correctly' do
      fill_in('First Name', with: 'John')
      fill_in('Last Name', with: 'Smith')
      fill_in('Email', with: 'abc@gmail.com')
      select('Ravenclaw', from: 'user_team_id')
      fill_in('Password', with: 'password')
      fill_in('Password Confirmation', with: 'password')
      click_button('Sign Up')

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'using an invalid email address to create a new account will
      re-render the page with an error message' do
      fill_in('First Name', with: 'John')
      fill_in('Last Name', with: 'Smith')
      fill_in('Email', with: 'abc@gmai')
      fill_in('Password', with: 'password')
      fill_in('Password Confirmation', with: 'password')

      click_button('Sign Up')

      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Email is invalid')
    end
  end
end
