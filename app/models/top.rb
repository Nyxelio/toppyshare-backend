class Top < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :title, presence: true
  validates :category, presence: true

end
