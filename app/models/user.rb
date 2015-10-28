class User < ActiveRecord::Base
  before_save :default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :likes
  has_many :product_likes, through: :likes, source: :Likeable , source_type: 'Product'
  has_many :review_likes, through: :likes, source: :likeable, source_type: 'Review'

  enum role: [:admin, :client, :guest]


  validates :name, :last_name, :user_name , presence: true
  validates :user_name, uniqueness: { case_sensitive: false }
  validate :validate_username


  def default_role
    self.role ||= 1
  end

  def validate_username
    if User.where(email: user_name).exists?
      errors.add(:user_name, :invalid)
    end
  end

  def to_s
    "#{self.name} #{self.last_name}"
  end

end
