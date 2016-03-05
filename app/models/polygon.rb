class Polygon < ActiveRecord::Base

  def self.npu
    JSON.parse(File.read('public/NPU_new.geojson'))
  end
end
