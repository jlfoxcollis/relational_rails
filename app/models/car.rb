class Car < ApplicationRecord
  belongs_to :road
  scope :date_time_sort, -> {order(parked?: :desc, created_at: :desc)}
end