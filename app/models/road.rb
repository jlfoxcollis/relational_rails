class Road < ApplicationRecord
  has_many :cars, dependent: :destroy

  def cars_count
    cars.count
  end

  def self.open_sort
    Road.order(open?: :desc)
  end
end
