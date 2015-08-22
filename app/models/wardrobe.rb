class Wardrobe < ActiveRecord::Base
  # ====================
  # Relations

  belongs_to :clothing
  belongs_to :user

  # ====================
  # Relations

  validates :clothing, presence: true
  validates :user, presence: true
  validates_uniqueness_of :clothing_id, :scope => :user_id

  def clothe
    if ! @clothing
      @clothing = self.clothing
    else
      @clothing
    end
  end

  def _clothe(clothing)
    @clothing = clothing
  end

  def self.retrieve(id)
    if id.kind_of?(Array)
      Wardrobe.includes(clothing: {:clothing_attrs => [:clothing_field]}).find(id).each do |ward|
        clo = ward.clothe
        attr = clo.clothing_attrs.each do |attr|
          attr._field(attr.clothing_field)
        end
        clo._attrs(attr)
        ward._clothe(clo)
      end
    else
      ward = Wardrobe.find(id)
      clo = ward.clothe
      attrs = clo.clothing_attrs.includes(:clothing_field).each do |attr|
        attr._field(attr.clothing_field)
      end
      ward._clothe(clo)
      ward
    end
  end
  def self.retrieve_all
    Wardrobe.includes(clothings: {:clothing_attrs => [:clothing_field]}).all.each do |ward|
      clo = ward.clothe
      attr = clo.clothing_attrs.each do |attr|
        attr._field(attr.clothing_field)
      end
      clo._attrs(attr)
      ward._clothe(clo)
    end
  end
end
