class ProductOrder < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :product_id, uniqueness: {scope: :order_id}
  validates :quantity
end
