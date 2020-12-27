require 'fedex'

class FedexShipper < Shipper
  include StatusReader
  include Mongoid::Document
  include Mongoid::Timestamps

  def initialize
    config = Rails.application.config_for(:fedex)
    @fedex = Fedex::Shipment.new(config.client)
  end

  def map_status
    shipper = { :name => "Sender",
      :company => "Company",
      :phone_number => "555-555-5555",
      :address => "Main Street",
      :city => "Harrison",
      :state => "AR",
      :postal_code => "72601",
      :country_code => "US" }

    recipient = { :name => "Recipient",
      :company => "Company",
      :phone_number => "555-555-5555",
      :address => "Main Street",
      :city => "Franklin Park",
      :state => "IL",
      :postal_code => "60131",
      :country_code => "US",
      :residential => "false" }

    packages = []
    packages << {
      :weight => {:units => "LB", :value => 2},
      :dimensions => {:length => 10, :width => 5, :height => 4, :units => "IN" }
    }
    # packages << {
    #   :weight => {:units => "LB", :value => 6},
    #   :dimensions => {:length => 5, :width => 5, :height => 4, :units => "IN" }
    # }

    shipping_options = {
      :packaging_type => "YOUR_PACKAGING",
      :drop_off_type => "REGULAR_PICKUP"
    }

    ship = @fedex.ship(:shipper=>shipper,
                  :recipient => recipient,
                  :packages => packages,
                  :service_type => "FEDEX_GROUND",
                  :shipping_options => shipping_options)
    puts ship
    ship[:completed_shipment_detail][:operational_detail][:transit_time]
  end
end
