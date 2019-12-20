class Review < ApplicationRecord
    belongs_to :rider
    belongs_to :giver
    belongs_to :user
    belongs_to :delivery
end
