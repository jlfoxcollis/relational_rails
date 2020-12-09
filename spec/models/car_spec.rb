require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Relationships' do
    it { should belong_to :road }
  end

  it 'Can sort by date time' do
    pine = Road.create(name: "Pine", open?: false, lanes: 9)

    a = pine.cars.create(name: "Abcd", parked?: true)
    b = pine.cars.create(name: "Bcde", parked?: true)
    c = pine.cars.create(name: "Cdef", parked?: true)

    expect(pine.cars).to eq([a, b, c])
  end
end
