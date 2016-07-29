require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should have_valid(:body).when('They make sleeping potion so powerful it is known as the Draught of Living Death.') }
  it { should_not have_valid(:body).when('', nil) }

  describe "#viewer_time" do
    it 'shows the hour and minute of the machine local time' do
      answer = create(:answer)

      expect(answer.viewer_time('UTC')).to eq(Time.now.utc.strftime('%H:%M'))
    end
  end

  describe '#year' do
    it 'shows the year of posting' do
      answer = create(:answer)

      expect(answer.year).to eq(answer.created_at.strftime('%Y'))
    end
  end

  describe '#month' do
    it 'shows the month of posting' do
      answer = create(:answer)

      expect(answer.month).to eq(answer.created_at.strftime('%m'))
    end
  end

  describe '#date' do
    it 'shows the year of posting' do
      answer = create(:answer)

      expect(answer.date).to eq(answer.created_at.strftime('%C'))
    end
  end
end
