class Address < ApplicationRecord
  has_many :employees_addresses
  has_many :employees, through: :employees_addresses

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  after_commit :geocode_location

  def geocode_location
    Geocoder.geocode(full_address)
  end

  def full_address
    "#{street} #{city}, #{state}, #{zipcode}"
  end
end
