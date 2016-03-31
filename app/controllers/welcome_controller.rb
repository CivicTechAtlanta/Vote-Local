require 'rgeo/geo_json'

class WelcomeController < ApplicationController
  def new
  end

  def index
    @geocoder = Geocoder.coordinates params['address']
    @features = getFeatures

    point = RGeo::Geographic.spherical_factory(:srid => 4326)
            .point(@geocoder[0],@geocoder[1])

    @feature = find_district(point, @features)
  end

  private
    def getFeatures
      file = File.open("./public/NPU_new.geojson", "rb")
      contents = file.read
      file.close

      RGeo::GeoJSON.decode(contents, json_parser: :json)
    end

    def find_district(point, features)

      features.size.times do |i|
        polygonCoords = features[i].geometry.coordinates[0]

        if pn_poly(point, polygonCoords)
          return features[i].properties
        end

        return Hash.new
      end
    end

    def pn_poly (point, polygonCoords)
      # ray-casting algorithm based on
      # http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
      x = point.x
      y = point.y

      if polygonCoords.length == 1
        polygonCoords = polygonCoords.first
      end

      inside = false
      numCoords = polygonCoords.length

      j = numCoords - 1
      numCoords.times do |i|
        xi = polygonCoords[i][0]
        yi = polygonCoords[i][1]

        xj = polygonCoords[j][0]
        yj = polygonCoords[j][1]

        intersect = ((yi > y) != (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi)
        if intersect
          inside = !inside
        end

        j = i + 1
      end

      return inside
    end
end
