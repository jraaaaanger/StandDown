require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should have_valid(:body).when("They make sleeping potion so powerful it is known as the Draught of Living Death.") }
  it { should_not have_valid(:body).when("", nil) }
end
