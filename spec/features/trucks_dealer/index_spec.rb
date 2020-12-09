require 'rails_helper'

RSpec.describe 'it can display stuff', type: :feature do
  it 'can display trucks and info' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    expect(page).to have_content("#{truck2.make}")
  end

  it 'can search by year' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    fill_in "search", with: 1990

    click_on "search"

    expect(page).to have_content("#{truck2.make}")
    expect(page).to_not have_content("#{truck1.make}")
  end

  it 'can have sad path' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    click_on "search"

    expect(current_path).to eq(trucks_dealer_path(medved.id))
  end

  it 'can sort' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    click_on "Sort"

    expect(page.all('tr')[1]).to have_content("#{truck1.make}")
    expect(page.all('tr')[2]).to have_content("#{truck2.make}")
  end

  it 'can seach by exact make' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    fill_in "search", with: "Ford"

    choose "radio_Exact_Match"

    click_on "search"

    expect(page.all('tr')[1]).to have_content("#{truck2.make}")
  end

  it 'can seach by partial make' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_dealer_path(medved.id)

    fill_in "search", with: "For"

    choose "radio_Partial"

    click_on "search"

    expect(page.all('tr')[1]).to have_content("#{truck2.make}")
  end
end
