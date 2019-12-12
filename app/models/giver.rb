class Giver < ApplicationRecord
    belongs_to :user
    has_many :deliveries

    #  def address 
    #     [street, city, postcode, state, country].compact.join(", ") 
    #   end 
    
    #   def address_changed? 
    #     street_changed?||city_changed?||postcode_changed||zip_changed?||state_changed? 
    #   end 

end
