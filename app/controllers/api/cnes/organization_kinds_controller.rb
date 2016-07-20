class Api::Cnes::OrganizationKindsController < ApplicationController
  def index
    render json: OrganizationKind.all
  end
end
