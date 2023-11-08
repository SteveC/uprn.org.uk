class CreateGeolocations < ActiveRecord::Migration[7.0]
  def change
    create_table :geolocations do |t|
      t.st_point :geo, geographic: true
    end
    
    add_index :geolocations, :geo, using: :gist
    
  end
end
