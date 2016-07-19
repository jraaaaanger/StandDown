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
end
