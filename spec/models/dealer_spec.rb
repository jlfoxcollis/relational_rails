require 'Time'
require 'date'

require 'rails_helper'

RSpec.describe Dealer, type: :model do
  describe 'relationships' do
    it { should have_many :trucks }
  end

  describe 'class methods' do
    describe '#date_time_sort' do
      it 'returns dealers sorted by creation date' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)

        expect(Dealer.date_time_sort).to eq([medved, bradley_ford])
      end
    end

    describe '#update_date_time_sort' do
      it 'returns dealers sorted by updated_at' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)
        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        bradley_ford.update!(name: "not bradley ford")

        expect(Dealer.update_date_time_sort).to eq([bradley_ford, medved])
      end
    end

    describe '#time_format' do
      it 'updates time format' do
        medved = Dealer.create!(name: "Medved", city: "Denver", state: "CO", open: true)

        expect(medved.time_format).to eq(Time.now.strftime('%m/%d/%Y'))

        bradley_ford = Dealer.create!(name: "Bradley Ford", city: "LHC", state: "CO", open: true)
        allow(bradley_ford).to receive(:created_at) { DateTime.parse("1909-11-05 16:34:45") }

        expect(bradley_ford.time_format).to eq("11/05/1909")
      end
    end
  end
end
