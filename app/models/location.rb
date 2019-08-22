require 'net/http'

class Location < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  # before_save :coordinates

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
    url_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location.address},+CA&key=#{Rails.application.credentials.google_maps_api_key}"
    # Make URI object out of URL string
    url = URI.parse(url_string)
    # Set up request
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    # Parse json from API
    json = JSON.parse(res.body)
    # Assign response fields to your model's lat and long properties
    self.lat = json['latitude']
    self.long = json['longitude']
    # api call
    # latitude goes in self.latitude
    # longitude goes in self.longitude
    # DO NOT CALL self.save
  end

  mount_uploader :photo, PhotoUploader
end


