class User < ActiveRecord::Base

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tops, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  has_many :followers, class_name: 'User',
           foreign_key: 'follower_id'

  belongs_to :follower, class_name: 'User'

end
