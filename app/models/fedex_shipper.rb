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
    #status = ["CREATED", "ON_TRANSIT", "DELIVERED", "EXCEPTION"]
    results =  @fedex.track(:tracking_number => tracking_number)
    fedex_status = results.first.status
    puts fedex_status
    case fedex_status
    when "Shipment information sent to FedEx"
      "CREATED"
    when "Delivered"
      "DELIVERED"
    when /exception|cancelled/
      "EXCEPTION"
    else
      "ON_TRANSIT"
    end
  end
end
