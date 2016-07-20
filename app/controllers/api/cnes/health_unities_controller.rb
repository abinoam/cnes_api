class Api::Cnes::HealthUnitiesController < ApplicationController
  def index
    render json: HealthUnity.all
  end
end
