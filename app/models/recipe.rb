class Recipe < ApplicationRecord
  belongs_to :user  #user対recipe→1対多

  validates :title, presence: true
  validates :description, presence: true
end
