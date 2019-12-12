class AdsController < ApplicationController

    def index
        
        adsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.giver.user.id, "user_name" => ad.giver.user.name}}
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
        myAds = Ad.all.filter{|ad| ad.giver.user_id ==1}
        myAdsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.giver.user.id, "user_name" => ad.giver.user.name}}
        render json: myAdsFr
    end
    
    def create
        
        if params["ad"]["postcode"]
            ad = params["ad"]
        else
            giverCode = Giver.all.find(1).postcode 
            
            ad = params["ad"]
            ad["postcode"] = giverCode
        end
        
        
        newAd = Ad.create(food_name: ad["food_name"], giver_id: ad["giver_id"], postcode: ad["postcode"])
        
        newAdFormatted = {"id" => newAd.id,"food_name" => newAd.food_name, "postcode" => newAd.postcode, "user_id" => newAd.giver.user.id, "user_name" => newAd.giver.user.name}
        render json: newAdFormatted
    end

    def destroy
        
        Ad.destroy(params[:id])
      end

    private

    def ad_params
        params.require(:ad).permit!
    end
end
