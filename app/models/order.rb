class Order < ActiveRecord::Base
  belongs_to :product

  validates :quantity, presence: true
end
