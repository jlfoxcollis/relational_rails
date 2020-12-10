require 'rails_helper'

describe 'Roads index page', type: :feature do

  it 'Can Display Info' do
    main = Road.create!(name: "Main Street", lanes: 2, open?: true)
    alley = Road.create!(name: "Alley 617", lanes: 0, open?: false)

    visit '/roads'

    expect(page).to have_content("#{main.name}")
    expect(page).to have_content("#{alley.name}")
  end

  it 'Can link to new road', type: :feature do
    main = Road.create!(name: "Main Street", lanes: 2, open?: true)

    visit '/roads'

    expect(page).to have_link("Create a Road", href: '/roads/new')

    visit '/roads/new'

    expect(page).to have_button('submit')

    fill_in 'name', with: 'THIS IS A ROAD'

    click_button('submit')

    expect(current_path).to eq('/roads')

    expect(page).to have_content("THIS IS A ROAD")
  end

  # Alt of lines 20-32
  scenario 'creating a road' do
    visit '/roads'
    click_link 'Create a Road'
    fill_in 'name', with: 'ROAD 1'
    expect{
      click_button 'submit'
    }.to change(Road, :count).by(1)
  end

  it 'Can display a portion of roads by lanes' do
    pine = Road.create(name: "Pine", open?: false, lanes: 9)
    elm = Road.create(name: "Elm", open?: true, lanes: 6)
    water = Road.create(name: "Water", open?: false, lanes: 1)

    visit '/roads'

    expect(page).to have_content("#{water.name}")

    fill_in 'lane filter', with: "#{water.lanes}"

    click_button 'filter'

    expect(page).to have_content("#{pine.name}")
    expect(page).to have_content("#{elm.name}")
    expect(page).not_to have_content("#{water.name}")
  end

  it 'Can sort roads by cars' do
    elm = Road.create(name: "Elm", open?: true, lanes: 6)
    pine = Road.create(name: "Pine", open?: false, lanes: 9)

    5.times do
      Road.all.each do |road|
        road.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)
      end
    end

    pine.cars.create(name: Faker::Vehicle.make_and_model, parked?: Faker::Boolean.boolean)

    visit "/roads"

    expect(page.all('a')[3]).to have_content("#{elm.name}")
    expect(page.all('a')[4]).to have_content("#{pine.name}")

    click_button 'sort'

    expect(page.all('a')[3]).to have_content("#{pine.name}")
    expect(page.all('a')[4]).to have_content("#{elm.name}")
  end
end
