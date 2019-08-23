require 'net/http'

class Location < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many :reviews, through: :bookings

  before_save :coordinates

  validates :address, presence: true
  validates :title, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def coordinates
    # The API URL: you may wanna add URI.encode() around location.address for URL encoding
    url_string = "https://nominatim.openstreetmap.org/search?q=#{self.address}&format=json"
    # Make URI object out of URL string
    uri = URI.parse(url_string)
    response = Net::HTTP.get(uri)
    # Parse json from API
    json = JSON.parse(response)
    puts json
    # Assign response fields to your model's lat and long properties
    unless json[0].nil?
      self.latitude = json[0]['lat'].to_f
      self.longitude = json[0]['lon'].to_f
    end
    # api call
    # latitude goes in self.latitude
    # longitude goes in self.longitude
    # DO NOT CALL self.save
  end

  mount_uploader :photo, PhotoUploader
end


