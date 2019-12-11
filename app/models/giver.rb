class Giver < ApplicationRecord
    belongs_to :user
    has_many :deliveries
end
