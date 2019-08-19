class Location < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :address, presence: true
  validates :title, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
