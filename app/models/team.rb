class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :timezone, presence: true
  validates :description, length: { maximum: 200 }

end
