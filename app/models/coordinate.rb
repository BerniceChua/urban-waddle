class Coordinate < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  # Remember to create a migration!
  attr_accessor :address, :latitude, :longitude

  geocoded_by :address   # can also be an IP address
  after_validation :geocode, if: :address_changed?         # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

end
