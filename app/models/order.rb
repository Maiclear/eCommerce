class Order < ActiveRecord::Base
  before_save :default_status

  belongs_to :user

  has_many :product_orders
  has_many :products, through: :product_orders



  validates :status, presence: true

  enum status: [:pending, :paid, :canceled]

  def default_status
    self.status ||= 0
  end

end
