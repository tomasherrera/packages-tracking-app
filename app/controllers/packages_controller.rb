class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.includes(:truck).order(created_at: :desc)
    @packages = @packages.status(filtering_params[:status]) if filtering_params[:status].present?
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was created' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was updated' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    def set_package
      @package = Package.find(params[:id])
    end

    def filtering_params
      params.permit(:status)
    end

    def package_params
      params.fetch(:package, {}).permit(:truck_id, :tracking_id, :weight, :content, :sender_name, :sender_address, :receiver_name, :receiver_address, :status, :latitude, :longitude, :current_location)
    end
end