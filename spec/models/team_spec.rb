require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_valid(:name).when('Gryffindor', 'Ravenclaw') }
  it { should_not have_valid(:name).when("", nil) }

  it { should have_valid(:description).when('', nil, 'Their daring, nerve, and chivalry sets Gryffindors apart.') }

  it { should have_valid(:city).when('Hogsmeade', 'Scottish Highlands') }
  it { should_not have_valid(:city).when("", nil) }

  it { should have_valid(:country).when('Scotland', 'Great Britain') }
  it { should_not have_valid(:country).when(nil, '') }
end
