class Road < ApplicationRecord
  has_many :cars, dependent: :destroy

  def self.open_sort
    Road.order(open?: :desc)
  end

  def self.more_lanes_than(min_lanes)
    Road.where("lanes > ?", min_lanes.to_i)
  end

  def self.by_cars
    Road.all.sort_by {|road| -road.child_count(:cars)}
  end

  def cars_by_parked
    cars.order(parked?: :desc)
  end

  def alphabetical
    cars.order(:name)
  end
end
