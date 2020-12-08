require 'rails_helper'

describe 'Roads Cars', type: :feature do

  it 'Can can display all cars' do
    main1 = Road.create!(name: "Main Street", lanes: 2, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", parked?: true)
    honda = main1.cars.create!(name: "Buddy", parked?: false)

    visit "/roads/#{mini.road_id}/cars"

    expect(page).to have_content("#{mini.name}")
    expect(page).to have_content("#{honda.name}")
  end
end
