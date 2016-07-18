class Question < ActiveRecord::Base
  belongs_to :organization
  has_many :teams, through: :organization
  has_many :answers

  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
