FactoryBot.define do
  factory :dealer do
    name { Faker::Book.title }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    open { Faker::Boolean.boolean }
  end

  factory :truck do
    year { rand(1900..2020) }
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    dealer
  end

  factory :road do
    name { Faker::Address.street_suffix }
    open? { Faker::Boolean.boolean }
    lanes { rand(2..6) }
  end

  factory :car do
    name { Faker::Vehicle.make_and_model }
    parked? { Faker::Boolean.boolean }
    road
  end
end


# def dealer_with_trucks(trucks_count: 5)
#   FactoryBot.create(:dealer) do |dealer|
#     FactoryBot.create_list(:truck, trucks_count, dealer: dealer)
#   end
# end
