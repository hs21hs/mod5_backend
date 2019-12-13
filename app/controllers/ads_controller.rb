class AdsController < ApplicationController

    def index
        
        adsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.user.id, "user_name" => ad.user.name}}
        render json: adsFr
       
    end

    def filter_ads
       
        l1 = Geocoder.coordinates(params["postcode"]+", London, United Kingdom")
        distance = params["radius"]
        
        filtered = Ad.all.select do |ad|

            l2 = ad.postcode+", London, United Kingdom"
            distance = Geocoder::Calculations.distance_between(l1,l2)

            if distance < params["radius"].to_i 
                true
            end
        end
        
        render json: filtered
    end

    def my_ads
       myAds = Ad.all.filter{|ad| ad.user_id ==@current_user.id}
       myAdsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "postcode" => ad.postcode, "user_id" => ad.user.id, "user_name" => ad.user.name}}
       render json: myAdsFr   
    end

    def create
        ad = Ad.create(ad_params)
        
        user = @current_user
        ad.update(user: user)
        
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
    
    # def create
        
    #     if params["ad"]["postcode"]
    #         ad = params["ad"]
    #     else
    #         userCode = User.all.find(1).postcode 
            
    #         ad = params["ad"]
    #         ad["postcode"] = userCode
    #     end
        
        
    #     newAd = Ad.create(food_name: ad["food_name"], user_id: ad["user_id"], postcode: ad["postcode"])
        
    #     newAdFormatted = {"id" => newAd.id,"food_name" => newAd.food_name, "postcode" => newAd.postcode, "user_id" => newAd.user.id, "user_name" => newAd.user.name}
        
    #     render json: newAdFormatted
    # end

    def destroy
        
        Ad.destroy(params[:id])
      end

    private

    def ad_params
        params.require(:ad).permit(:food_name)
    end
end
