class Shipper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  has_many :jobs

  def initialize(name, status)
    self.name = name
  end
end
