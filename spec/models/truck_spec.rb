require 'Time'
require 'rails_helper'

RSpec.describe Truck, type: :model do
  describe 'Relationships' do
    it { should belong_to :dealer }
  end

  describe 'Class method' do
    it 'can filter by keyword' do
      medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
      bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
      truck1 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
      truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Chevy")
      truck3 = medved.trucks.create!(year: 1999, model: "F150", make: "chevy")

      expect(Truck.search("Ford")).to eq([truck1])
    end
  end
end
