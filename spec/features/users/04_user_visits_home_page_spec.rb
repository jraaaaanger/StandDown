require 'rails_helper'

feature 'user sees home page' do
  context 'before signing in' do
    scenario 'visits home and sees offline content' do
      visit root_path

      expect(page).to have_content('Welcome to StandDown.')
      expect(page).to_not have_content('Signed In Successfully')
    end
  end

  context 'after signing in' do
    let!(:organization) { create(:organization) }
    let!(:question) { create(:question, organization: organization) }
    let!(:team) { create(:team, organization: organization) }
    let!(:user) { create(:user, team: team) }
    before(:each) do
      login_as user
      visit root_path
    end

    scenario 'visits home and sees welcome info' do
      expect(page).to have_content('Hello, ' + user.fullname)
      expect(page).to have_content(team.city)
      expect(page).to have_link(organization.name)
    end

    scenario 'visits home and sees a standup if it\'s after the start time' do
      @time_now = Time.new(2016, 10, 31, 10, 0, 0).utc
      allow(team.time_zone).to receive(:now).and_return(@time_now)

      expect(page).to have_content(Time.now.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(question.body)
    end

    scenario 'visits home and sees a form after clicking the question', js: true do
      @time_now = Time.new(2016, 10, 31, 10, 0, 0).utc
      allow(Time).to receive(:now).and_return(@time_now)

      click_link(question.body)

      expect(page).to have_css('input')
    end

    scenario 'visits home and answers a question', js: true do
      @time_now = Time.new(2016, 10, 31, 10, 0, 0).utc
      allow(Time).to receive(:now).and_return(@time_now)

      click_link(question.body)
      fill_in('answer', with: 'They are the same plant which is also known as aconite.')
      click_link 'Answer'

      expect(page).to have_content 'They are the same plant which is also known as aconite.'
    end

    scenario 'expects not to see question form after answering question', js: true do
      @time_now = Time.new(2016, 10, 31, 10, 0, 0).utc
      allow(Time).to receive(:now).and_return(@time_now)

      click_link(question.body)
      fill_in('answer', with: 'They are the same plant which is also known as aconite.')
      click_link 'Answer'

      expect(page).to_not have_css('input')

      visit root_path

      expect(page).to have_content 'Your next standup is'
    end
  end
end
