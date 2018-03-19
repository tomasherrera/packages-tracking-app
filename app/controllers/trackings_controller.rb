class TrackingsController < ApplicationController
  skip_before_action :authenticate_admin!

  def index
  end

  def lookup
    @package = Package.public_packages.find_by_tracking_id(tracking_params[:tracking_id])
    respond_to do |format|
      if @package.present?
        format.html { render :lookup }
        format.json { render json: @package }
      else
        format.html {redirect_to root_path, alert: "Package Not Found with Tracking ID # #{tracking_params[:tracking_id]}"}
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def tracking_params
      params.permit(:tracking_id)
    end
end
