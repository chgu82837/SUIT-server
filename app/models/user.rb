class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ====================
  # Relations

  has_many :user_choises
  has_many :choises, through: :user_choises, source: :clothing
  has_many :wardrobes
  has_many :clothings, through: :wardrobes
  has_many :recommends
  has_many :recommendeds, through: :recommends, source: :clothing

end
