
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

    visit trucks_dealer_path(medved.id)

    expect(page).to have_link("Adopt A Truck")

    click_link "Adopt A Truck"

    expect(current_path).to eq("/dealers/#{medved.id}/trucks/new")

    fill_in 'year', with: '1909'
    fill_in 'make', with: 'ford'
    fill_in 'model', with: 'F150'

    click_button 'Create a Truck'

    expect(page).to have_content("1909")
  end

  it "can filter by year" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "F150", make: "Ford")

    visit "/trucks"

    fill_in 'orderbyyear', with: 1995
    click_on 'sort'
    expect(page).not_to have_content("#{truck1.year}")
    expect(page).to have_content("#{truck2.year}")
  end

end
