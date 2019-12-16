class DeliveriesController < ApplicationController
    def gcreate
        giver = @current_user.giver.id
        rider = @current_user.rider.id 
        delivery = Delivery.create(rider_id: rider, giver_id: giver, food_bank_id: 1, status: "processing", d_type:"self")

        if delivery.valid?
            render json: delivery
        end
    end

    def rcreate
     
        rider_id = @current_user.rider.id 
        ad = Ad.all.find(params["ad"]["id"])
        giver_id = ad.user.giver.id
        pick_up_postcode = ad.postcode
        food_name = ad.food_name
        food_bank_id = ad.food_bank_id

        giver_email = Giver.all.find(giver_id).user.email
        rider_email = Rider.all.find(rider_id).user.email
        food_bank_name = FoodBank.all.find(food_bank_id).name
        
        extra = {:rider_email=>rider_email,:giver_email=>giver_email, :food_bank_name=>food_bank_name}
        
        delivery = Delivery.create( rider_id: rider_id, giver_id: giver_id, food_bank_id: food_bank_id, pick_up_postcode: pick_up_postcode, status: "processing", d_type: "aided")
        
        dobj ={:delivery=>delivery, :extra=>extra}
       
        if delivery.valid?
            render json: dobj
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

        ffdels = fdels.map do |d| 
            giver_email = Giver.all.find(d.giver_id).user.email
            rider_email = Rider.all.find(d.rider_id).user.email
            food_bank_name = FoodBank.all.find(d.food_bank_id).name
            extra = {:rider_email=>rider_email,:giver_email=>giver_email, :food_bank_name=>food_bank_name}
            
            x = {:delivery=>d, :extra=>extra}
        
        end
        render json: ffdels
        
        
    end

        

    private

    def delivery_params()
        params.require(:delivery).permit(:rider_id, :giver_id, :food_bank_id)
    end
      
end
