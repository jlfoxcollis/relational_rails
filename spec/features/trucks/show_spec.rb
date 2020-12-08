
require 'rails_helper'

RSpec.describe "can show stuff on show page", type: :feature do
  it "can display a single truck show page" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/trucks/#{truck.id}"

    expect(page).to have_content(1999) && have_content("Ford") && have_content("F150")
  end

  it "can update a truck" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/trucks/#{truck.id}"

    click_on "Edit Truck"

    expect(current_path).to eq("/trucks/#{truck.id}/edit")

    fill_in 'make', with: "Chevy"

    click_on 'update'

    expect(current_path).to eq("/trucks/#{truck.id}")
    expect(page).to have_content("Chevy")
  end

  it "can DESTROY" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/trucks/#{truck.id}"

    expect(page).to have_link('Delete')
    expect{
    click_link 'Delete'
  }.to change(Truck, :count).by(-1)
  end
end
