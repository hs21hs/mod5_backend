class Conversation < ApplicationRecord
    has_many :messages
    belongs_to :giver
    belongs_to :rider
end
