class GeolocationsController < ApplicationController
    def show
        @geolocation = Geolocation.find(params[:id])
        render json: {
          id: @geolocation.id,
          latitude: @geolocation.latitude,
          longitude: @geolocation.longitude
        }
    end

    def bbox
        # Define your bounding box coordinates
        # bottom_left_lat, bottom_left_long, top_right_lat, top_right_long
        bottom_left_lat, bottom_left_long, top_right_lat, top_right_long = params.values_at(:bottom_left_lat, :bottom_left_long, :top_right_lat, :top_right_long)
    
        # Convert to float to avoid SQL injection and ensure proper querying
        bottom_left_lat = bottom_left_lat.to_f
        bottom_left_long = bottom_left_long.to_f
        top_right_lat = top_right_lat.to_f
        top_right_long = top_right_long.to_f
    
        # Query using ST_MakeEnvelope to create a bounding box
        @geolocations = Geolocation.where("geo && ST_MakeEnvelope(?, ?, ?, ?, 4326)", bottom_left_long, bottom_left_lat, top_right_long, top_right_lat)
                                   .limit(100)
    
        # Return the geolocations with only the id, latitude, and longitude in the JSON response
        render json: @geolocations.map { |geo|
          {
            id: geo.id,
            latitude: geo.latitude,
            longitude: geo.longitude
          }
        }
      end
end
