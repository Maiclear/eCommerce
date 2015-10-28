class User < ActiveRecord::Base
  before_save :default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :product_likes, through: :likes, source: :product
  has_many :review_likes, through: :likes, source: :review

  enum role: [:admin, :client, :guest]



  validates :user_name, uniqueness: { case_sensitive: false }



  def default_role
  self.role ||= 2
  end
end
