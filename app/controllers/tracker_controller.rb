class TrackerController < ApplicationController
  # GET /status/:provider
  def status
    status_options = ["CREATED", "ON_TRANSIT", "DELIVERED", "EXCEPTION"]
    num = rand() * status_options.size()
    opt = num.floor
    @status = status_options[opt]
    @provider = params[:provider]
    @package_id = params[:package]
  end

  # GET /track/:provider
  def track
    @provider = params[:provider]
    fedex = FedexShipper.new()
    @track_status = fedex.map_status()
  end
end
