require 'rails_helper'

RSpec.describe 'Test the Monster Trucks!', type: :feature do
  it "can show truck attributes" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    visit "/trucks"

    expect(page).to have_content(1999) && have_content("Ford") && have_content("F150")
  end

  it "can display trucks by dealer" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/dealers/#{medved.id}/trucks/"
    expect(page).to have_content(1999) && have_content("Ford") && have_content("F150")
  end

  it "can show a create child" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/dealers/#{medved.id}/trucks"

    expect(page).to have_link("Adopt A Truck")

    click_link "Adopt A Truck"

    expect(current_path).to eq("/dealers/#{medved.id}/trucks/new/")

    fill_in 'year', with: '1909'

    click_button 'create'

    expect(current_path).to eq("/dealers/#{medved.id}/trucks")
    expect(page).to have_content("1909")

  end
end
