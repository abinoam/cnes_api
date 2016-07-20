class HealthCareEstablishment < ActiveRecord::Base
  has_one :location
  belongs_to :administrative
  belongs_to :teaching_activity
  belongs_to :organization_kind
  belongs_to :health_unity
end
