require 'rails_helper'

describe 'Can make a new car', type: :feature do
  
  it 'Form something' do
    main1 = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", driving?: false, parked?: true)
    honda = main1.cars.create!(name: "Buddy", driving?: true, parked?: false)

    visit "/roads/#{mini.road.id}/cars/new"

    fill_in 'name', with: 'Herbert'

    click_button 'create'

    expect(current_path).to eq("/roads/#{mini.road.id}/cars")
    expect(page).to have_content("Herbert")
  end
end