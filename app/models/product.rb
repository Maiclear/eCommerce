class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :product_categories
  has_many :category, through: :product_categories

  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true


end
