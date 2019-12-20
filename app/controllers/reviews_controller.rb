class ReviewsController < ApplicationController
    
    def index
    
    end
        
    def create
        #define the owner of this review
        
        reviewer = @current_user
        #find out if they are the giver or rider
        delivery = Delivery.all.find(params["review"]["delivery_id"])
        
        if reviewer.rider.id == delivery.rider.id 
            review = Review.create(delivery_id: delivery.id, user_id: delivery.giver.user.id, reviewer_id: reviewer.id, rider_id: reviewer.rider.id, giver_id: delivery.giver.id, reviewer: "rider")
        else
            review = Review.create(delivery_id: delivery.id, user_id: delivery.rider.user.id, reviewer_id: reviewer.id, rider_id: delivery.rider.id, giver_id: reviewer.giver.id, reviewer: "giver")
        end
        
        review.update(rating: params["review"]["rating"],content: params["review"]["content"])
        
        render json: review
        #make it so u cant make another review on the same delivery
        
    end

    def delete
    end


end
