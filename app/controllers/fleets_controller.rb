class FleetsController < ApplicationController
  before_action :set_fleet, only: [:show]

  def index
    @fleets = Fleet.includes(:trucks).all
  end

  def show
  end

  def new
    @fleet = Fleet.new
  end

  def create
    @fleet = Fleet.new(fleet_params)
    respond_to do |format|
      if @fleet.save
        format.html { redirect_to controller: 'fleets', action: 'index', notice: 'Fleet was created' }
        format.json { render :show, status: :created, location: @fleet }
      else
        format.html { render :new }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_fleet
      @fleet = Fleet.find(params[:id])
    end

    def fleet_params
      params.fetch(:fleet, {}).permit(:city, :state, :country)
    end
end
