class Api::Cnes::AdministrativesController < ApplicationController
  def index
    render json: Administrative.all
  end
end
