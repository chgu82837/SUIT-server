class ClothingField < ActiveRecord::Base
  # ====================
  # Relations

  has_many :clothing_attrs

  # ====================
  # Validation

  validates :name, presence: true
  validates :func, presence: true

end
