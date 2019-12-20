class User < ApplicationRecord
    has_secure_password
    has_one :rider
    has_one :giver
    has_many :reviews
end
