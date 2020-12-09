require 'rails_helper'

RSpec.describe "Dealer index display", type: :feature do
  it "can see all dealers names" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)

    visit "/dealers"

    expect(page).to have_content("#{medved.name}")
    expect(page).to have_content("#{bradley_ford.name}")
  end

  it "can create a new dealer" do

    visit "/dealers"

    expect(page).to have_link("Add a Dealer")

    click_link "Add a Dealer"

    expect(page).to have_button('create')

    fill_in 'name', with: 'Bradley Ford'

    click_button('create')
    expect(current_path).to eq('/dealers')
    expect(page).to have_content("Bradley Ford")
  end

  it 'can count' do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/dealers/#{medved.id}/trucks"

    expect(page).to have_content("Number of Trucks: #{medved.trucks_count}")
  end

  it 'can sort by date' do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    allow(bradley_ford).to receive(:created_at) { DateTime.parse("1909-11-05 16:34:45") }

    expect(Dealer.update_date_time_sort).to eq([bradley_ford, medved])
  end
end
