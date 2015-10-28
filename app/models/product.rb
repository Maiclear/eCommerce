class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :reviews, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :user_likes, through: :likes, source: :user

  has_many :orders

  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true


  def remove_like user
    self.likes.where(user: user).first.delete
  end

  def liked_by?(user)
    self.user_likes.include? user
  end


end
