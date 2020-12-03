require 'rails_helper'

describe 'Roads show page', type: :feature do
  
  it 'Can Display Info' do
    main = Road.create!(name: "Main Street", lanes: 2, parking?: true, open?: false)

    visit "roads/#{main.id}"

    expect(page).to have_content("#{main.name}")
    expect(page).to have_content("#{main.lanes}")
    expect(page).to have_content("#{main.parking?}")
    expect(page).to have_content("#{main.open?}")
  end
end