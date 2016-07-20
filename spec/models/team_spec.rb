require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_valid(:name).when('Gryffindor', 'Ravenclaw') }
  it { should_not have_valid(:name).when("", nil) }

  it { should have_valid(:description).when('', nil, 'Their daring, nerve, and chivalry sets Gryffindors apart.') }

  it { should have_valid(:city).when('Hogsmeade', 'Scottish Highlands') }
  it { should_not have_valid(:city).when("", nil) }

  it { should have_valid(:country).when('Scotland', 'Great Britain') }
  it { should_not have_valid(:country).when(nil, '') }

  describe '#location' do
    it 'returns the city and state if state is given' do
      team = create(:team, city: 'Sacramento', state: 'CA')

      expect(team.location).to eq('Sacramento, CA')
      expect(team.location).to_not eq('Sacramento, Great Britain')
      expect(team.location).to_not eq('Sacramento, CA, Great Britain')
    end

    it 'returns the city and country if no state is given' do
      team = create(:team)

      expect(team.location).to eq('Hogsmeade, Great Britain')
    end
  end
end
