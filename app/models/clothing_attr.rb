class ClothingAttr < ActiveRecord::Base
  # ====================
  # Relations

  belongs_to :clothing
  belongs_to :clothing_field

  # ====================
  # Validation

  validates :clothing, presence: true
  validates :clothing_field, presence: true

  # ====================
  # Field

  def name
    self.field.name
  end
  def func
    self.field.func
  end

  def field
    if ! @field
      @field = self.clothing_field
    else
      @field
    end
  end

  def _field(f)
    @field = f
    self
  end

  def to_s
    "#{self.name}: #{self.value}"
  end
end
