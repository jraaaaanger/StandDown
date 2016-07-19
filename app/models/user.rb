class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :description, length: { maximum: 140 }

  belongs_to :team
  has_one :organization, through: :team
  has_many :answers

  def fullname
    "#{first_name} #{last_name}"
  end
end
