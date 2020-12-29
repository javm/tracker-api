require 'test_helper'
require 'json'

class TrackerControllerTest < ActionDispatch::IntegrationTest
  setup do
    file = File.read('test/fixtures/shipments_data.json')
    @data_hash = JSON.parse(file)
    puts @data_hash
  end

  test "should get tracker" do
    @data_hash.each do |d|
      tracking_number = d["tracking_number"]
      begin
        get '/track/fedex?package=' + tracking_number , as: :json
        puts response.body
        assert_response :success
      rescue StandardError => err
        puts "Error running test: " + err.message
      end
    end
  end
end
