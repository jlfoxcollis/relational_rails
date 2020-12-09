require 'rails_helper'

describe 'Roads show page', type: :feature do

  it 'Can Display Info' do
    main = Road.create!(name: "Main Street", lanes: 2, open?: false)

    visit "roads/#{main.id}"

    expect(page).to have_content("#{main.name}")
    expect(page).to have_content("#{main.lanes}")
    expect(page).to have_content("#{main.open?}")
  end

  it 'Can Edit Info' do
    main = Road.create!(name: "Main Street", lanes: 2, open?: false)

    visit "roads/#{main.id}"

    expect(page).to have_link("EDIT", href: "/roads/#{main.id}/edit")
  end

  scenario 'creating a road' do
    main1 = Road.create!(name: "Main Street", lanes: 2, open?: false)

    visit "roads/#{main1.id}"
    click_link 'EDIT'
    fill_in 'name', with: 'MAIN STREET'
    click_button 'update'
    expect(page).to have_content("MAIN STREET")
  end

  scenario 'deleting a road' do
    @main1 = Road.create!(name: "Main Street", lanes: 2, open?: false)
    alley = Road.create!(name: "Alley 617", lanes: 0, open?: false)

    visit "/roads/#{@main1.id}"

    expect(page).to have_link("DELETE", href: "/roads/#{@main1.id}")

    expect {click_link 'DELETE'}.to change(Road, :count).by(-1)

    expect(page).not_to have_content("Main Street")
    expect(page).to have_content(alley.name)
  end

  it 'Can sort cars alphabetically' do
    pine = Road.create(name: "Pine", open?: false, lanes: 9)

    a = pine.cars.create(name: "Abcd", parked?: true)
    b = pine.cars.create(name: "Bcde", parked?: true)
    c = pine.cars.create(name: "Cdef", parked?: true)

    visit "/roads/#{pine.id}/cars"

    expect(page.all('a')[3]).to have_content("#{c.name}")
    expect(page.all('a')[4]).to have_content("#{b.name}")
    expect(page.all('a')[5]).to have_content("#{a.name}")

    click_button 'alphabetize'

    expect(page.all('a')[3]).to have_content("#{a.name}")
    expect(page.all('a')[4]).to have_content("#{b.name}")
    expect(page.all('a')[5]).to have_content("#{c.name}")
  end
end
