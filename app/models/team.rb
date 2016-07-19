class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :questions, through: :organization
  has_many :users
  has_many :answers

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :timezone, presence: true
  validates :description, length: { maximum: 200 }

  def location
    if state.nil? || state.empty?
      return "#{city}, #{country}"
    else
      return "#{city}, #{state}"
    end
  end

  def local_time(user_time)
    team_offset = Timezone[timezone].utc_offset / 3600
    user_offset = Timezone[user_time].utc_offset / 3600
    difference = team_offset - user_offset
    if team_offset == user_offset
      return "You are in the same timezone as #{name}."
    elsif difference > 0
      return "#{name} is #{difference} hours ahead of you."
    elsif difference < 0
      return "#{name} is #{difference * -1} hours behind you."
    end
  end
end
