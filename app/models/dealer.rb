class Dealer < ApplicationRecord
has_many :trucks, dependent: :destroy
end
