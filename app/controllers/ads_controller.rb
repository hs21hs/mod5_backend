class AdsController < ApplicationController

    def index
        adsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.giver.user.id, "user_name" => ad.giver.user.name}}
        render json: adsFr
    end

    def my_ads
        myAds = Ad.all.filter{|ad| ad.giver.user_id ==1}
        myAdsFr = Ad.all.map{|ad| {"id" => ad.id, "food_name" => ad.food_name, "user_id" => ad.giver.user.id, "user_name" => ad.giver.user.name}}
        render json: myAdsFr
    end
    
    def create
        newAd = Ad.create(ad_params)
        newAdFormatted = {"id" => newAd.id,"food_name" => newAd.food_name, "user_id" => newAd.giver.user.id, "user_name" => newAd.giver.user.name}
        render json: newAdFormatted
    end

    def destroy
        
        Ad.destroy(params[:id])
      end

    private

    def ad_params
        params.require(:ad).permit(:giver_id,:food_name)
    end
end
