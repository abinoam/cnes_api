class Location < ActiveRecord::Base
  belongs_to :health_care_establishment
  has_one :coordinate
end
