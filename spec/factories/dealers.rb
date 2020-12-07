FactoryBot.define do
  factory :dealer do
    name { Faker::Book.title }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
  end

  factory :truck do
    year { rand(1900..2020) }
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    dealer
  end
end


def dealer_with_trucks(trucks_count: 5)
  FactoryBot.create(:dealer) do |dealer|
    FactoryBot.create_list(:truck, trucks_count, dealer: dealer)
  end
end
