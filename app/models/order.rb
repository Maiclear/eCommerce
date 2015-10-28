class Order < ActiveRecord::Base
  belongs_to :product

  has_many :product_orders
  has_many :products, through: :product_orders

  validates :quantity, presence: true
end
