require 'rails_helper'

describe 'Car edit functionality', type: :feature do
  it 'Form Edit' do
    main1 = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", driving?: false, parked?: true)
    honda = main1.cars.create!(name: "Buddy", driving?: true, parked?: false)

    visit "/cars/#{mini.id}"

    expect(page).to have_link('edit', href: "/cars/#{mini.id}/edit")

    click_link 'edit'

    expect(current_path).to eq("/cars/#{mini.id}/edit")

    fill_in 'name', with: 'Herbert'

    click_button 'update'

    expect(current_path).to eq("/cars/#{mini.id}")
    expect(page).to have_content("Herbert")
  end

  it 'Catches unnamed Car' do
    main1 = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", driving?: false, parked?: true)

    visit "/cars/#{mini.id}/edit"

    fill_in 'name', with: ''

    click_button 'update'

    expect(current_path).to eq("/cars/#{mini.id}/edit")
  end
end
