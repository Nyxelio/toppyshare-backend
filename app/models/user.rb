class User < ActiveRecord::Base

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tops, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :followings,
                          class_name: "User",
                          join_table: :followings,
                          foreign_key: :user_id,
                          association_foreign_key: :following_user_id

  has_and_belongs_to_many :followers,
                          class_name: "User",
                          join_table: :followings,
                          foreign_key: :following_user_id,
                          association_foreign_key: :user_id
end
