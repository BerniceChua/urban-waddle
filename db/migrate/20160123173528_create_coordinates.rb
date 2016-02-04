class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :street_address
      t.string :geocode
      t.float :latitude
      t.float :longitude
      t.string :reverse_geocode
      t.timestamps
    end
  end
end
