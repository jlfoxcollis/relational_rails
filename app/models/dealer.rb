require 'Time'
class Dealer < ApplicationRecord
  has_many :trucks, dependent: :destroy

  def self.date_time_sort
    Dealer.order("open DESC, created_at DESC")
  end

  def self.update_date_time_sort
    Dealer.order(updated_at: 'desc')
  end

  def time_format
    created_at.strftime('%m/%d/%Y')
  end

  def trucks_count
    trucks.count
  end

  def self.sort_by_trucks_count
    Dealer.all.sort_by {|dealer| -dealer.trucks_count}
  end

  def sort_alphabetically
    trucks.order('LOWER(make) ASC')
  end

  def partial_search(find)
    key = "%#{find[:search]}%"

    trucks.where("make || model like :search", search: key)
  end

  def exact_search(find)
    key = "#{find}"

    trucks.where("make = :finder", finder: key) || Truck.where("make = :finder", finder: key)
  end

  def search_year(search)
    trucks.where("year >= ?", search)
  end
end
