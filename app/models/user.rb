class User < ApplicationRecord
    has_secure_password
    has_one :rider
    has_one :giver
end
