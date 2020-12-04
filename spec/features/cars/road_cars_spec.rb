require 'rails_helper'

describe 'Roads Cars', type: :feature do

  it 'Can can display all cars' do
    main1 = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", driving?: false, parked?: true)
    honda = main1.cars.create!(name: "Buddy", driving?: true, parked?: false)

    visit "/roads/#{mini.road.id}/cars"

    expect(page).to have_content("#{mini.name}")
    expect(page).to have_content("#{honda.name}")
  end
end