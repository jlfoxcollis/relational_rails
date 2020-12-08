require 'Time'
class Dealer < ApplicationRecord
  has_many :trucks, dependent: :destroy
  # scope :sort_trucks, -> { order("trucks ASC") }

  def self.date_time_sort
    Dealer.order("open DESC, created_at ASC")
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
end
