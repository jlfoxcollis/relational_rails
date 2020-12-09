require 'rails_helper'

RSpec.describe Road, type: :model do
  describe 'relationships' do
    it { should have_many :cars }
  end

  describe 'Class methods' do
    it 'Can count' do
      road1 = FactoryBot.create_list(:road, 1).first

      5.times do
        Road.all.each do |road|
          road.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
        end
      end

      expect(road1.cars_count).to eq(5)
    end

    it 'Can sort true values first' do
      pine = Road.create(name: "Pine", open?: false, lanes: 9)
      elm = Road.create(name: "Elm", open?: true, lanes: 6)
      water = Road.create(name: "Water", open?: false, lanes: 1)
    
      expect(Road.open_sort).to eq([elm, pine, water])
    end

    it 'Can display roads with more lanes' do
      pine = Road.create(name: "Pine", open?: false, lanes: 9)
      elm = Road.create(name: "Elm", open?: true, lanes: 6)
      water = Road.create(name: "Water", open?: false, lanes: 1)

      expect(Road.more_lanes_than(water.lanes)).to eq([pine, elm])
    end

    it 'Can sort by number of cars' do
      all_roads = FactoryBot.create_list(:road, 3)
      road1 = all_roads.first
      road2 = all_roads[1]
      road3 = all_roads.last

      1.times do
        road1.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end

      4.times do
        road2.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end

      3.times do
        road3.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end

      expect(Road.by_cars).to eq([road2, road3, road1])
    end

    
    it 'Sorts cars by parked?' do
      pine = Road.create(name: "Pine", open?: false, lanes: 9)

      a = pine.cars.create(name: "Abcd", parked?: true)
      b = pine.cars.create(name: "Bcde", parked?: false)
      c = pine.cars.create(name: "Cdef", parked?: true)

      expect(pine.cars_by_parked).to eq([a, c, b])
    end
  end
end
