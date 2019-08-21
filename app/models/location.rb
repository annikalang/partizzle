class Location < ApplicationRecord
  has_many :bookings
  belongs_to :user

  # before_save :coordinates

  validates :address, presence: true
  validates :title, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true

  private

  def coordinates
    # api call
    # latitude goes in self.latitude
    # longitude goes in self.longitude
    # DO NOT CALL self.save
  end
  mount_uploader :photo, PhotoUploader
end
