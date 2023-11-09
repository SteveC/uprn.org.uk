class Geolocation < ApplicationRecord
    def latitude
        self.geo.lat
    end
    
    # Returns the longitude of the geo point
    def longitude
        self.geo.lon
    end
end
