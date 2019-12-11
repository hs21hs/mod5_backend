class User < ApplicationRecord
    has_one :rider
    has_one :giver
end
