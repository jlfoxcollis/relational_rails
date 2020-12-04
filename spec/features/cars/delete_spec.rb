require 'rails_helper'

describe 'Car delete functionality', type: :feature do
  it 'Can delete' do
    main1 = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", driving?: false, parked?: true)
    honda = main1.cars.create!(name: "Buddy", driving?: true, parked?: false)

    visit "/cars/#{mini.id}"

    expect(page).to have_link('delete', href: "/cars/#{mini.id}")

    expect{ click_link 'delete' }.to change(Car, :count).by(-1)

    expect(current_path).to eq("/cars")
    expect(page).not_to have_content("#{mini.name}")
  end
end