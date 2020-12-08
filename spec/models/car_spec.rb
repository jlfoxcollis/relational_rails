require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Relationships' do
    it { should belong_to :road }
  end

  it 'Can sort by date time' do
    FactoryBot.create_list(:road, 1)
    
    4.times do
      Road.all.each do |road|
        road.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end
    end



    1.times do
      Road.all.each do |road|
        @early = road.cars.create(name: "early", parked?: Faker::Boolean.boolean)
      end
    end

    allow(@early).to receive(:created_at) {DateTime.parse("1909-11-05 16:34:45") }

    # don't look here
    array = []
    Car.date_time_sort.each do |car|
      array << car.name
    end

    expect(array.first).to eq("#{@early.name}")
  end
end