class Jobs
  include Mongoid::Document
  include Mongoid::Timestamps
  field :status, type: String
  field :tracking_number, type: String
  field :tries, type: Integer
  belongs_to :shipper
end
