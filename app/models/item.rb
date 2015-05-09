class Item < ActiveRecord::Base
  belongs_to :top

  validates :title, presence: true

end
