class Api::Cnes::TeachingActivitiesController < ApplicationController
  before_action :set_teaching_activity, only: [:show, :edit, :update, :destroy]

  # GET /api/cnes/teaching_activities
  # GET /api/cnes/teaching_activities.json
  def index
    render json: TeachingActivity.all
  end

  # GET /api/cnes/teaching_activities/1
  # GET /api/cnes/teaching_activities/1.json
  def show
  end

  # GET /api/cnes/teaching_activities/new
  def new
    @teaching_activity = TeachingActivity.new
  end

  # GET /api/cnes/teaching_activities/1/edit
  def edit
  end

  # POST /api/cnes/teaching_activities
  # POST /api/cnes/teaching_activities.json
  def create
    @teaching_activity = TeachingActivity.new(teaching_activity_params)

    respond_to do |format|
      if @teaching_activity.save
        format.html { redirect_to @teaching_activity, notice: 'Teaching activity was successfully created.' }
        format.json { render :show, status: :created, location: @teaching_activity }
      else
        format.html { render :new }
        format.json { render json: @teaching_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/cnes/teaching_activities/1
  # PATCH/PUT /api/cnes/teaching_activities/1.json
  def update
    respond_to do |format|
      if @teaching_activity.update(teaching_activity_params)
        format.html { redirect_to @teaching_activity, notice: 'Teaching activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @teaching_activity }
      else
        format.html { render :edit }
        format.json { render json: @teaching_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/cnes/teaching_activities/1
  # DELETE /api/cnes/teaching_activities/1.json
  def destroy
    @teaching_activity.destroy
    respond_to do |format|
      format.html { redirect_to teaching_activities_url, notice: 'Teaching activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def teaching_activity
      @teaching_activity = Api::Cnes::TeachingActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teaching_activity_params
      params.require(:teaching_activity).permit(:activity)
    end
end
