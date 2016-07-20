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
    user.team.utc_difference - utc_difference
  end

  def question_time
    start_h = organization.start.hour
    start_min = organization.start.min
    now_h = Time.now.hour
    now_m = Time.now.min
    if now_h >= start_h && now_m >= start_min
      return true
    else
      return false
    end
  end
end
