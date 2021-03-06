require 'rails_helper'

RSpec.describe "Can see Dealer with attributes", type: :feature do
  it "can show dealers attributes" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)

    visit "/dealers/#{medved.id}"

    expect(page).to have_content("#{medved.name}") && have_content("#{medved.state}") && have_content("#{medved.city}") && have_content("#{medved.open}")
  end

  it "can update a dealer" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)

    visit "/dealers/#{medved.id}"

    expect(page).to have_link("Edit")

    click_link "Edit"

    click_button 'update'

    expect(current_path).to eq("/dealers/#{medved.id}/edit")
    fill_in 'name', with: "MedFord"

    click_button 'update'
    expect(current_path).to eq("/dealers/#{medved.id}")
    expect(page).to have_content("MedFord")
  end

  it "can DESTROY" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "Ford", make: "Ford")
    visit show_dealer_path(medved.id)

    expect(page).to have_link("Delete")

    click_link "Delete"
    expect(current_path).to eq("/dealers")
  end

  it "can display child count" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: false)
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/dealers/#{medved.id}/trucks"

    expect(page).to have_content("Number of Trucks: #{medved.child_count(:trucks)}")
  end

  it "can sort by boolean" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: false)
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/dealers/#{medved.id}"

    expect(Dealer.date_time_sort).to eq([bradley_ford, medved])
  end


end
