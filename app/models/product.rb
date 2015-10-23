class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, presence: true , uniqueness: true
  validates :price, presence: true
  validates :stock, presence: true


end
