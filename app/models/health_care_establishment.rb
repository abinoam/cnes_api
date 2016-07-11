class HealthCareEstablishment < ActiveRecord::Base
  has_one :address
  has_one :Sponsor
end
