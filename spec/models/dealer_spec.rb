
require 'Time'
require 'date'
require 'rails_helper'

RSpec.describe Dealer, type: :model do
  describe 'relationships' do
    it { should have_many :trucks }
  end

  describe 'class methods' do
    describe '#date_time_sort' do
      it 'returns dealers sorted by creation date' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        sleep(2)
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        expect(Dealer.date_time_sort).to eq([bradley_ford, medved])
      end
    end

    describe '#update_date_time_sort' do
      it 'returns dealers sorted by updated_at' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        bradley_ford.update!(name: "not bradley ford")

        expect(Dealer.update_date_time_sort).to eq([bradley_ford, medved])
      end
    end

    describe '#time_format' do
      it 'updates time format' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)

        expect(medved.time_format).to eq(Time.now.strftime('%m/%d/%Y'))

        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        allow(bradley_ford).to receive(:created_at) { DateTime.parse("1909-11-05 16:34:45") }

        expect(bradley_ford.time_format).to eq("11/05/1909")
      end
    end

    describe '#child_count(:trucks)' do
      it 'can count' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

        expect(medved.child_count(:trucks)).to eq(1)
      end
    end

    describe '#date_time_sort' do
      it 'can sort' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: false)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(Dealer.date_time_sort).to eq([medved, bradley_ford])
      end

      it 'can sort by trucks count' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(Dealer.sort_by_trucks_count).to eq([medved, bradley_ford])
      end

      it 'can sort alphabetically' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(medved.sort_alphabetically).to eq([truck1, truck2])
      end
    end

    describe 'it can search' do
      it 'can search by year' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(medved.search_year(1990)).to eq([truck2])
      end

      it 'can search by exact' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(medved.exact_search("Ford")).to eq([truck2])
      end

      it 'can search by partial' do
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
        truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

        expect(medved.partial_search("Chev")).to eq([truck1])
      end
    end
  end
end
