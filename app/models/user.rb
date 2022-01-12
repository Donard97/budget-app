class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :payments

  validates :name, :surname, :email, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true

  private

  def set_role
    update(role: 'user')
  end
end
