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
    fedex_status = nil
    begin
      results =  @fedex.track(:tracking_number => tracking_number)
    rescue StandardError => err
      fedex_status = "Exception running test: " + err.message
    end
    if(not fedex_status)
      fedex_status = results.first.status
    end
    case fedex_status
    when "Shipment information sent to FedEx"
      status = "CREATED"
    when "Delivered"
      status = "DELIVERED"
    when /exception|cancelled/i
      status = "EXCEPTION"
    else
      status = "ON_TRANSIT"
    end

    {:provider_message => fedex_status, :status => status}

  end
end
