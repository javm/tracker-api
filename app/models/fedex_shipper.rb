require 'fedex'

class FedexShipper < Shipper
  include StatusReader
  include Mongoid::Document
  include Mongoid::Timestamps

  def initialize
    config = Rails.application.config_for(:fedex)
    @fedex = Fedex::Shipment.new(config.client)
  end

  def map_status(tracking_number)
    results =  @fedex.track(:tracking_number => tracking_number)
    results.first.status
  end
end
