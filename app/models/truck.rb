class Truck < ApplicationRecord
  belongs_to :dealer

  def self.sort_and_search(filters)
    if filters[:exact] == "Exact Match"
      exact_search(filters[:filter])
    elsif filters[:exact] == nil && filters[:filter] != nil
      partial_search(filters[:filter])
    else
      search_year(filters[:orderbyyear])
    end
  end

  def self.search_year(search)
    Truck.where("year >= ?", search)
  end

  def self.exact_search(filter)
    Truck.where('make || model = ?', "#{filter}")
  end

  def self.partial_search(filter)
    Truck.where("make || model like ?", "%#{filter}%")
  end
end
