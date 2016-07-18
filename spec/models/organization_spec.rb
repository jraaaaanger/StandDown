require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should have_valid(:name).when('Hogwarts School of Witchcraft and Wizardry') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:description).when("It's bewitched to look like the night sky.", '', nil) }
end
