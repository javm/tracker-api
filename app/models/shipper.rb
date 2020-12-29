class Shipper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  def initialize(name, status)
    self.name = name
  end
end
