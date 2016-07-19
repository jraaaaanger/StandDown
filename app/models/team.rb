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
end
