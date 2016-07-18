require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_valid(:body).when("What would I get if I added powdered root of Asphodel to an Infusion of Wormwood?") }
  it { should_not have_valid(:body).when("", nil) }
end
