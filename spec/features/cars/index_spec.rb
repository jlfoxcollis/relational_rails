require 'rails_helper'

describe 'Cars index page', type: :feature do

  it 'Can display index' do
    main1 = Road.create!(name: "Main Street", lanes: 2, open?: false)
    mini = main1.cars.create!(name: "Tom's mini", parked?: true)

    visit '/cars'

    expect(page).to have_content("#{mini.name}")
    expect(page).to have_content("#{mini.parked?}")
  end
end
