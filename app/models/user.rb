class User < ApplicationRecord
<<<<<<< HEAD
  has_many :recipes, dependent: :destroy
=======
  has_many :recipes, dependent: :destroy  #user対recipe→1対多
>>>>>>> new-branch-name2

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, uniqueness: true
end
