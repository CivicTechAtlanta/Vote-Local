

class DistrictsController < ApplicationController
  def index
    #todo
  end

  def new
    #todo
    @district = nil
  end

  def create
    District.create(district_params)
    redirect_to welcome_path
  end

  def show
    #todo
  end

  def edit
    #todo
  end

  def update
    #todo
  end

  def destroy
    #todo
  end

  private
  def district_params
    params.require(:name).permit(:type, :description)
  end

  def find_district(point, map)
    district_array = map.features

    district_array.length.times do |i|
      polygonCoords = district_array[i].geometry.coordinates[0]

      if pn_poly(point, polygonCoords)
        return district_array
    end
  end

  def pn_poly (point, polygonCoords)
    # ray-casting algorithm based on
    # http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
    x = point[0]
    y = point[1]

    inside = false
    numCoords = polygonCoords.length

    j = numCoords - 1
    numCoords.times do |i|
      xi = [i][0]
      yi = vs[i][1]

      xj = vs[j][0]
      yj = vs[j][1]

      intersect = ((yi > y) != (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi)
      if intersect
        inside = !inside
      end

      j = i + 1
    end

    return inside
  end
end
