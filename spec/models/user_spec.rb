require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when("Minerva", "Albus") }
  it { should_not have_valid(:first_name).when("", nil) }

  it { should have_valid(:last_name).when("McGonagall", "Dumbledore") }
  it { should_not have_valid(:last_name).when("", nil) }

  it { should have_valid(:email).when("chesskitty@hogwarts.edu", "apwbd@hogwarts.edu") }
  it { should_not have_valid(:email).when("moldyvoldy@", "durmstrang.com", "", nil) }

  it { should have_valid(:description).when("Transfiguration Professor, Deputy Headmistress", nil) }
  it { should_not have_valid(:description).when("Professor Albus Percival Wulfric Brian Dumbledore, Order of Merlin (first class), Headmaster of Hogwarts School of Witchcraft and Wizardry, Supreme Mugwump of the International Confederation of Wizards, and Chief Warlock of the Wizengamot.")}

  describe "#fullname" do
    it 'returns the users first and last name as a single string' do
      user = create(:user)
      expect(user.fullname).to eq('Rubeus Hagrid')
    end
  end
end
