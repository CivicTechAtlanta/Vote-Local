class District < ActiveRecord::Base
  has_many :events
  has_many :officials
end