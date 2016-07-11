class HealthCareEstablishment < ActiveRecord::Base
  has_one :location
  has_one :Sponsor
end
