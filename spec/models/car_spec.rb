require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Relationships' do
    it { should belong_to :road }
  end

  it 'Can sort by date time' do
    FactoryBot.create_list(:road, 1)

    1.times do
      Road.all.each do |road|
        @early = road.cars.create(name: "early", parked?: true)
      end
    end
    sleep(4)
    4.times do
      Road.all.each do |road|
        road.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end
    end


    allow(@early).to receive(:created_at) {DateTime.parse("1909-11-05 16:34:45") }

    # don't look here
    array1 = []
    Car.date_time_sort.each do |car|
      array1 << car.name
    end
    expect(array1.first).to eq("#{@early.name}")
  end
end
