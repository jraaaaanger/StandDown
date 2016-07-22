class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :question
  has_one :organization, through: :team

  validates :body, presence: true
  validates :body, length: { maximum: 200 }

  def submitter_time
    updated_at.in_time_zone(user.local_zone).strftime('%H:%M')
  end

  def viewer_time(timezone)
    updated_at.in_time_zone(timezone).strftime('%H:%M')
  end

  def year
    updated_at.strftime('%Y')
  end

  def month
    updated_at.strftime('%m')
  end

  def date
    updated_at.strftime('%C')
  end

  def year_local(timezone)
    updated_at.in_time_zone(timezone).strftime('%Y')
  end

  def month_local(timezone)
    updated_at.in_time_zone(timezone).strftime('%m')
  end

  def date_local(timezone)
    updated_at.in_time_zone(timezone).strftime('%C')
  end
end
