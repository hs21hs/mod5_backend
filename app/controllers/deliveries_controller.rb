class DeliveriesController < ApplicationController
    def gcreate
        giver = @current_user.giver.id
        rider = @current_user.rider.id 
        delivery = Delivery.create(rider_id: rider, giver_id: giver, food_bank_id: 1)

        if delivery.valid
            render json: delivery
        end
    end

    def rcreate
        rider = @current_user.rider.id 
        ad = Ad.all.find(params["ad_id"])
        giver = ad.user.giver.id
        delivery = Delivery.create(rider_id: rider, giver_id: giver, food_bank_id: 1)
        
        if delivery.valid
            render json: delivery
        end
    end
        

    private

    def delivery_params()
        params.require(:delivery).permit(:rider_id, :giver_id, :food_bank_id)
    end
      
end
