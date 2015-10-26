class ProductCategory < ActiveRecord::Base
  belongs_to :product
  belongs_to :category

  validates :product_id, uniqueness: {scope: :categorie_id}
end
