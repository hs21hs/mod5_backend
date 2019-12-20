class ReviewsController < ApplicationController
    
    def index
    
    end
        
    def show_user
        
        show_user= User.all.find(params["showUsersId"])
        show_users_reviews = show_user.reviews


        reviews_with_reviewer_details = show_users_reviews.map do |review|
           
            reviewer = User.all.find(review.reviewer_id)
            
            reviewrers_ratings_ar = reviewer.reviews.all.map do |review|
                review.rating
            end
            
            if reviewrers_ratings_ar.length == 0 || reviewrers_ratings_ar.sum == 0
                des = {"review" => review, "reviewer_details" => reviewer}
            else
            reviewers_avg_rating = reviewrers_ratings_ar.sum/reviewrers_ratings_ar.length
            des = {"review" => review, "reviewer_details" => reviewer, "reviewers_avg_rating" => reviewers_avg_rating}
            end

        end
        
        render json: reviews_with_reviewer_details
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
