class Category < ActiveRecord::Base
  has_many :product_categories
  has_many :product, through: :product_categories

  def to_s
    self.name
  end

end
