class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :description, length: { maximum: 140 }

  belongs_to :team
  has_one :organization, through: :team
  has_many :answers

  def fullname
    "#{first_name} #{last_name}"
  end

  def no_standup_message
    if all_answered_today?
      "Your next standup is tomorrow at " + organization.start.strftime("%H:%M %p") + "."
    else
      "Your next standup is today at " + organization.start.strftime("%H:%M %p") + "."
    end
  end

  def local_time
    team.time_zone.now
  end

  def local_zone
    team.time_zone
  end

  def time_here(time)
    time.in_time_zone(local_zone)
  end

  def last_answer_time
    answers.last.updated_at
  end

  def question_time?
    local_time.time.strftime("%H%M%S") > organization.start.strftime("%H%M%S")
  end

  def today_date
    local_time.strftime("%d")
  end

  def today_month
    local_time.strftime("%m")
  end

  def today_year
    local_time.strftime("%Y")
  end

  def answered_today?(question_id)
    this_answers = Answer.where(user_id: id, question_id: question_id)
    this_answers.each do |a|
      if a.date_local(local_zone) == today_date && a.month_local(local_zone) == today_month && a.year_local(local_zone) == today_year
        return true
        break
      end
    end
    return false
  end

  def all_answered_today?
    organization.questions.each do |q|
      unless answered_today?(q.id)
        return false
      end
    end
    true
  end

end
