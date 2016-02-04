class Coordinate < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  # Remember to create a migration!
  attr_accessor :latitude, :longitude

  geocoded_by :street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

end
