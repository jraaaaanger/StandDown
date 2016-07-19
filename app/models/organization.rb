class Organization < ActiveRecord::Base
  has_many :teams
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :users, through: :teams
  has_many :answers, through: :questions

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
