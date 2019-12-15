class DeliveriesController < ApplicationController
    def gcreate
        giver = @current_user.giver.id
        rider = @current_user.rider.id 
        delivery = Delivery.create(rider_id: rider, giver_id: giver, food_bank_id: 1, status: "processing")

        if delivery.valid?
            render json: delivery
        end
    end

    def rcreate
       
        rider = @current_user.rider.id 
        ad = Ad.all.find(params["ad_id"])
        giver = ad.user.giver.id
        delivery = Delivery.create(rider_id: rider, giver_id: giver, food_bank_id: 1, status: "processing")
        byebug
        if delivery.valid?
            render json: delivery
        end
    end

    def my_deliveries
        user = @current_user
        if params["type"] === "giver"
            mdels = Delivery.all.select do |d|
                @current_user.giver.id === d.giver.id
            end
        end

        if params["type"] === "rider"
            mdels = Delivery.all.select do |d|
                @current_user.rider.id === d.rider.id
            end
        end

        if params["type"] === "either"
            mdels = Delivery.all.select do |d|
                @current_user.giver.id === d.giver.id || @current_user.rider.id === d.rider.id
            end
        end

        if params["type"] === "both"
            mdels = Delivery.all.select do |d|
                @current_user.giver.id === d.giver.id && @current_user.rider.id === d.rider.id
            end
        end

            
        fdels = mdels.select do |d|
             d.status===params["status"] 
        end
        
        render json: fdels
        
    end

        

    private

    def delivery_params()
        params.require(:delivery).permit(:rider_id, :giver_id, :food_bank_id)
    end
      
end
