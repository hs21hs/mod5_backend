class Delivery < ApplicationRecord
    belongs_to :rider
    belongs_to :giver
    belongs_to :food_bank
    has_many :reviews
end
