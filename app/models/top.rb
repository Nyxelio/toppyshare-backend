class Top < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :items
end
