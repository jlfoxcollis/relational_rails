
require 'rails_helper'

RSpec.describe 'truck edit form', type: :feature do
  it 'has a form for editing' do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/trucks/#{medved.trucks.first.id}"

    click_link "Edit Truck"

    fill_in 'make', with: "Chevy"

    click_button 'patch'

    expect(current_path).to eq("/trucks/#{medved.trucks.first.id}")
    expect(page).to have_content("Chevy")
    end
  end
