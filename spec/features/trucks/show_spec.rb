
require 'rails_helper'

RSpec.describe "can show stuff on show page", type: :feature do
  it "can display a single truck show page" do
    medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
    medved.trucks.create!(year: 1999, model: "F150", make: "Ford")

    visit "/trucks/#{medved.trucks.first.id}"

    expect(page).to have_content(1999) && have_content("Ford") && have_content("F150")
  end
end
