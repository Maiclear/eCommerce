class Product < ActiveRecord::Base
  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :product_categories
  has_many :category, through: :product_categories

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user


  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true


end
