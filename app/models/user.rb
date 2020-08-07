class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  has_many :posts, dependent: :destroy

  has_many :like

  has_many :comments
  has_many :commenting, through: :comments, source: :post

  def comments?(other_user)
    self.commenting.include?(other_user)
  end

end
