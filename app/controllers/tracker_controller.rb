class TrackerController < ApplicationController
  # GET /track/:provider
  def track
    tries = 2
    @provider = params[:provider]
    @package_id = params[:package]
    carrier = eval(@provider.capitalize() + "Shipper").new()
    @track_status = carrier.map_status(@package_id)
    if(@track_status[:status] == 'EXCEPTION')
      while(tries > 0 or @track_status[:status] != 'EXCEPTION')
        @track_status = TrackPackageJob.perform_now(carrier, @package_id)
        tries = tries - 1
      end
    end
  end
end
