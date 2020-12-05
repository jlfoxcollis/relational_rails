require 'Time'
class Dealer < ApplicationRecord
  has_many :trucks, dependent: :destroy

  def self.date_time_sort
    Dealer.order(created_at: 'asc')
  end

  def self.update_date_time_sort
    Dealer.order(updated_at: 'desc')
  end

  def time_format
    created_at.strftime('%m/%d/%Y')
  end
end
