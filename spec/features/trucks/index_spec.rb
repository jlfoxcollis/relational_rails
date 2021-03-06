
require 'rails_helper'

RSpec.describe 'Test the Monster Trucks!', type: :feature do
  it 'can display all trucks' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_path

    expect(page).to have_content("#{truck2.make}")
    expect(page).to have_content("#{truck1.make}")
  end

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

  it "can show a create child and have sad path" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit trucks_dealer_path(medved.id)

    expect(page).to have_link("Adopt A Truck")

    click_link "Adopt A Truck"

    click_button 'Create a Truck'

    expect(current_path).to eq("/dealers/#{medved.id}/trucks/new")

    fill_in 'year', with: '1909'
    fill_in 'make', with: 'ford'
    fill_in 'model', with: 'F150'

    click_button 'Create a Truck'

    expect(page).to have_content("1909")
  end

  it "can filter by year and has a sad path" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "F150", make: "Ford")

    visit "/trucks"

    click_on 'search'

    fill_in 'search', with: 1995
    click_on 'search'
    expect(page).not_to have_content("#{truck1.year}")
    expect(page).to have_content("#{truck2.year}")
  end

  it "can Sort" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "F150", make: "Chevy")

    visit "/trucks"

    click_on 'Sort'
    expect(page.all('tr')[1]).to have_content("#{truck1.make}")
    expect(page.all('tr')[3]).to have_content("#{truck2.make}")
  end

  it 'can seach by exact make' do
    bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    truck2 = medved.trucks.create!(year: 1999, model: "F150", make: "Ford")
    truck1 = medved.trucks.create!(year: 1989, model: "Malibu", make: "Chevy")

    visit trucks_path

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

    visit trucks_path

    fill_in "search", with: "For"

    choose "radio_Partial"

    click_on "search"

    expect(page.all('tr')[1]).to have_content("#{truck2.make}")
  end

end
