class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :users
  has_many :locations

  validates :type_of_party, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, inclusion: { in: ["confirmed", "pending", "rejected"] }
end
