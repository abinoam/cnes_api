class HealthCareEstablishment < ActiveRecord::Base
  has_one :location
  has_one :sponsor
  has_one :administrative
  has_one :teaching_activity
  has_one :organization_kind
  has_one :health_unity
end
