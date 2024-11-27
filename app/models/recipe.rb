class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipe_steps, dependent: :destroy
  has_many :recipe_images, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :recipe_steps, :recipe_images, allow_destroy: true
end
