class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  include ApplicationHelper

  def cities
    render json: CS.cities(params[:state], :us).to_json
  end

  def fetch_trucks_from_fleet
    city_and_state_array = city_and_state(params[:address])
    fleet = Fleet.find_by_city_and_state(city_and_state_array[0], city_and_state_array[1])
    if fleet.present?
      trucks = fleet.trucks
      render json: trucks.to_json
    else
      render :json => {:error => "not-found"}.to_json, :status => 404
    end
  end
end
