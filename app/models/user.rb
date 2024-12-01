class User < ApplicationRecord
  has_many :recipes, dependent: :destroy  #user対recipe→1対多

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, uniqueness: true
end
