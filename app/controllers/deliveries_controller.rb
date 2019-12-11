class DeliveriesController < ApplicationController
    def create
        Delivery.create(delivery_params)
    end
        

    private

    def delivery_params()
        params.require(:delivery).permit(:rider_id, :giver_id, :food_bank_id)
    end
      
end
