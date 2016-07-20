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

  def time_zone
    ActiveSupport::TimeZone.[](timezone)
  end

  def local_time
    time_zone.now
  end

  def local_date
    time_zone.today
  end

  def utc_difference
    time_zone.utc_offset
  end

  def user_difference(user)
    teamtime = utc_difference
    usertime = user.team.utc_difference
    if (teamtime < 0 && usertime < 0) || (teamtime > 0 && usertime > 0)
      return usertime - teamtime
    elsif usertime < 0 && teamtime > 0
      return (teamtime * -1) + usertime
    elsif usertime > 0 && teamtime < 0
      return (usertime * -1) + teamtime
    elsif usertime == 0
      return teamtime
    elsif teamtime == 0
      return usertime
    end
  end

  def time_statement(user)
    time = user_difference(user) / 3600
    if time > 0
      return "#{name} is #{time} hours behind you."
    else
      return "#{name} is #{time * -1} hours ahead of you."
    end
  end

  def local_start
    start_time = organization.start.to_s[10...-4]
    time_zone.now
    time_zone.parse(start_time)
  end

  def question_time

  end
end
