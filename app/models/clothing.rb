class Clothing < ActiveRecord::Base
  # ====================
  # Relations

  has_many :clothing_attrs
  has_many :user_choises
  has_many :choosers, through: :user_choises, source: :user
  has_many :wardrobes
  has_many :users, through: :wardrobes
  has_many :recommends
  has_many :recommended_users, through: :recommends, source: :user

  # ====================
  # Validation

  validates :name, presence: true

  # ====================
  # Attributes

  def attrs
    if ! @attrs
      @attrs = self.clothing_attrs.includes(:clothing_field).each do |attr|
        attr._field(attr.clothing_field)
      end
    else
      @attrs
    end
  end
  def attr(field)
    attr = self.clothing_attrs.where(clothing_field_id: field.id).first
    attr._field(field)
  end
  def _attrs(attrs)
    @attrs = attrs
  end
  def <<(attr)
    self.clothing_attrs << attr
  end

  def self.retrieve(id)
    if id.kind_of?(Array)
      Clothing.includes(clothing_attrs: [:clothing_field]).find(id).each do |clo|
        attr = clo.clothing_attrs.each do |attr|
          attr._field(attr.clothing_field)
        end
        clo._attrs(attr)
      end
    else
      clo = Clothing.find(id)
      attrs = clo.clothing_attrs.includes(:clothing_field).each do |attr|
        attr._field(attr.clothing_field)
      end
      clo
    end
  end
  def self.retrieve_all
    Clothing.includes(clothing_attrs: [:clothing_field]).all.each do |clo|
      attr = clo.clothing_attrs.each do |attr|
        attr._field(attr.clothing_field)
      end
      clo._attrs(attr)
    end
  end
end
