class UserChoise < ActiveRecord::Base
  # ====================
  # Relations

  belongs_to :user
  belongs_to :clothing

  # ====================
  # Relations

  validates :user, presence: true
  validates :clothing, presence: true

end
