class FoodBank < ApplicationRecord
    has_many :deliveries
    has_many :ads
    has_many :riders, through: :deliveries
    has_many :givers, through: :deliveries
end
