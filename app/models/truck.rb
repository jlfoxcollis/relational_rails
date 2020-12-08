class Truck < ApplicationRecord
  belongs_to :dealer

  def self.search(filter)
    Truck.where("make || model like ?", "%#{filter}%")
  end
end
