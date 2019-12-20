class Review < ApplicationRecord
    belongs_to :rider
    belongs_to :giver
end
