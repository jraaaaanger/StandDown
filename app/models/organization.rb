class Organization < ActiveRecord::Base
  has_many :teams
  belongs_to :creator, class_name: "User"
  has_many :questions

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
