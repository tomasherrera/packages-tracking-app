class TrucksController < ApplicationController
  before_action :set_truck, only: [:show]

  def new
    @truck = Truck.new
    @selected_fleet = Fleet.find_by_city_and_state(params[:city], params[:state])
    @fleets = Fleet.all_except(@selected_fleet)
  end

  def create
    @truck = Truck.new(truck_params)
    respond_to do |format|
      if @truck.save
        format.html { redirect_to fleets_path(), notice: 'Truck was created' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def index
  end

  private
    def set_truck
      @truck = Truck.find(params[:id])
    end

    def truck_params
      params.fetch(:truck, {}).permit(:fleet_id)
    end
end
