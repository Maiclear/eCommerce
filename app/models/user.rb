class User < ActiveRecord::Base
  before_save :default_role
  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :client, :guest]



  validates :user_name, uniqueness: { case_sensitive: false }



  def default_role
  self.role ||= 2
  end
end
