class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :full_street_address
      t.string :geocode
      t.string :latitude
      t.string :longitude
      t.string :reverse_geocode
      t.timestamps
    end
  end
end
