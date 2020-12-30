class TrackPackageJob < ApplicationJob
  queue_as :default
  def perform(carrier, tracker_number)
    carrier.map_status(tracker_number)
  end
end
