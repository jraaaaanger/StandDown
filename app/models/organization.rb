class Organization < ActiveRecord::Base
  has_many :teams
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :users, through: :teams
  has_many :answers, through: :questions

  validates :name, presence: true
  validates :start, presence: true
  validates_format_of :start, with: /([01]?[0-9]|2[0-3])\:[0-5][0-9]/
  validates :description, length: { maximum: 200 }

  def start_time
    if start.strftime("%p") == "AM"
      clarifier = " this morning."
    elsif start_time("%p") == "PM"
      clarifier = " this afternoon."
    end

    return "Your next standup is at " + start.strftime("%I:%M") + clarifier
  end
end
