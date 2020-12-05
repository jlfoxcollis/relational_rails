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

    expect(current_path).to eq("/dealers/#{medved.id}/edit")
    fill_in 'name', with: "MedFord"

    click_button 'update'
    expect(current_path).to eq("/dealers/#{medved.id}")
    expect(page).to have_content("MedFord")
  end

  it "can DESTROY" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "Ford", make: "Ford")
    visit "/dealers/#{medved.id}"

    expect(page).to have_link("Delete")

    click_link "Delete"
    expect(current_path).to eq("/dealers")
  end


end
