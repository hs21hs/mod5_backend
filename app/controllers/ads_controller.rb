class AdsController < ApplicationController

    def index
        
        adsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.user.id, "user_name" => ad.user.name}}
        render json: adsFr
       
    end

    def all
        user = @current_user
        ads = Ad.all.select do |ad|
            if ad.user_id != user.id 
                true
            end
        end
        render json: ads
    end

    def filter_ads
        
        # l1 = Geocoder.coordinates(params["postcode"]+", London, United Kingdom")
        l1= params["postcode"]
        distance = params["radius"]
   
        filterForActive = Ad.all.select do |ad|
            
            if ad.active == true && @current_user.id != ad.user.id
                true
            end
        end

        filtered = filterForActive.select do |ad|
            if ad.postcode
                l2 = ad.postcode 
                distance = Geocoder::Calculations.distance_between(l1,l2)

                if distance < params["radius"].to_i 
                    true
                end
            end
        end
        
        render json: filtered
    end

    def my_ads
        
       myAds = Ad.all.filter{|ad| ad.user_id ==@current_user.id }
       myAdsFr = myAds.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "postcode" => ad.postcode, "user_id" => ad.user.id, "user_name" => ad.user.name, "active" => ad.active}}
       render json: myAdsFr   
    end

    def create
        ad = Ad.create(ad_params)
        user = @current_user
    
        ad.update(user: user, food_bank_id: 1, active:true)
        
        if ad.valid?
            if params["ad"]["postcode"]
                ad.update(postcode: params["ad"]["postcode"])
            else
                ad.update(postcode: user.postcode)
            end
            render json: ad
        else
            render json: {errors: ad.errors.full_messages}, status: :not_accepted
        end
    end
    
    def update_active
        ad = Ad.all.find(params["ad_id"])
        ad.update(active: !ad.active)
        render json: ad
    end

    def destroy
        
        Ad.destroy(params[:id])
      end

    private

    def ad_params
        params.require(:ad).permit(:food_name, :postcode)
    end
end
