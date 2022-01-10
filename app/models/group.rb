class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, :icon, presence: true, length: { maximum: 255 }
end
