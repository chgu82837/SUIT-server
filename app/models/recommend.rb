class Recommend < ActiveRecord::Base
  # ====================
  # Relations

  belongs_to :user
  belongs_to :clothing

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
      recommendeds = Recommend.includes(clothing: {:clothing_attrs => [:clothing_field]}).find(id).each do |recommend|
        clo = recommend.clothe
        attr = clo.clothing_attrs.each do |attr|
          attr._field(attr.clothing_field)
        end
        clo._attrs(attr)
        recommend._clothe(clo)
      end
      recommendeds.group_by { |e| e.group }
    else
      recommend = Recommend.find(id)
      clo = recommend.clothe
      attrs = clo.clothing_attrs.includes(:clothing_field).each do |attr|
        attr._field(attr.clothing_field)
      end
      recommend._clothe(clo)
      recommend
    end
  end
  def self.retrieve_all
    Recommend.includes(clothings: {:clothing_attrs => [:clothing_field]}).all.each do |recommend|
      clo = recommend.clothe
      attr = clo.clothing_attrs.each do |attr|
        attr._field(attr.clothing_field)
      end
      clo._attrs(attr)
      recommend._clothe(clo)
    end
  end
end
