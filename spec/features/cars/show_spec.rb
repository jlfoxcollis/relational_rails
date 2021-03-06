require 'rails_helper'

describe 'Car Display', type: :feature do

  it 'Can display its info' do
    main1 = Road.create!(name: "Main Street", lanes: 2, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", parked?: true)
    honda = main1.cars.create!(name: "Buddy", parked?: false)

    visit "/cars/#{mini.id}"

    expect(page).to have_content("#{mini.name}") && have_content("#{mini.road.name}") && have_content("#{mini.parked?}")
  end
end
