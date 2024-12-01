class Recipe < ApplicationRecord
  belongs_to :user  #user対recipe→1対多
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end
