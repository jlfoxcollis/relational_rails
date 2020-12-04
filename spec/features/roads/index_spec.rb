require 'rails_helper'

describe 'Roads index page', type: :feature do
  
  it 'Can Display Info' do
    main = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: true)
    alley = Road.create!(name: "Alley 617", lanes: 0, parking?: true, open?: false)

    visit '/roads'

    expect(page).to have_content("#{main.name}")
    expect(page).to have_content("#{alley.name}")
  end

  it 'Can link to new road', type: :feature do
    main = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: true)
    
    visit '/roads'

    expect(page).to have_link("Create a Road", href: '/roads/new')

    visit '/roads/new'

    expect(page).to have_button('submit')

    fill_in 'road[name]', with: 'THIS IS A ROAD'

    click_button('submit')

    expect(current_path).to eq('/roads')

    expect(page).to have_content("THIS IS A ROAD")
  end

  # Alt of lines 20-32
  scenario 'creating a road' do
    visit '/roads'
    click_link 'Create a Road'
    fill_in 'road[name]', with: 'ROAD 1'
    expect{
      click_button 'submit'
    }.to change(Road, :count).by(1)
  end
end