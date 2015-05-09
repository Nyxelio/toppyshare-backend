class User < ActiveRecord::Base
  has_many :tops

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :mail, presence: true

end
