class Organization < ActiveRecord::Base
  has_many :teams
  belongs_to :creator, class_name: "User"

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
