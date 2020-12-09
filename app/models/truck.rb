class Truck < ApplicationRecord
  belongs_to :dealer

  def self.search_year(search)
    Truck.where("year >= ?", search)
  end

  def self.partial_search(find)
    key = "%#{find}%"

    Truck.where("make || model like :search", search: key)
  end

  def self.exact_search(find)
    key = "#{find}"

    Truck.where("make = :finder", finder: key) || Truck.where("make = :finder", finder: key)
  end

  def self.sort_alphabetically
    order('LOWER(make) ASC')
  end
end
