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
          road.cars.create(name: Faker::Vehicle.make_and_model, driving?: Faker::Boolean.boolean, parked?: Faker::Boolean.boolean)
        end
      end

      expect(road1.cars_count).to eq(5)
    end

    it 'Can sort true values first' do
      pine = Road.create(name: "Pine", parking?: true, open?: false, lanes: 9)
      elm = Road.create(name: "Elm", parking?: true, open?: true, lanes: 6)
      water = Road.create(name: "Water", parking?: false, open?: false, lanes: 1)
    
      expect(Road.open_sort).to eq([elm, pine, water])
    end
  end
end
