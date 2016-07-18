class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :question
  has_one :organization, through: :team

  validates :body, presence: true
  validates :body, length: { maximum: 200 }
end
