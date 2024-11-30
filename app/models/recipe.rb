class Recipe < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipe_steps, dependent: :destroy
  has_many :recipe_images, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :recipe_steps, :recipe_images, allow_destroy: true
=======
  belongs_to :user  #user対recipe→1対多

  validates :title, presence: true
  validates :description, presence: true
>>>>>>> new-branch-name2
end
