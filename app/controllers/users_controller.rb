class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            Giver.create(user_id: user.id)
            Rider.create(user_id: user.id)
            render json: {user: user, token: issue_token({user_id: user.id})}
        else
            render json: {errors: user.errors.full_messages}, status: :not_accepted
        end
    end

    def login
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            render json: { user: user, token: issue_token({ user_id: user.id }) }
        else
            render json: { errors: ["Email or password incorrect"] }, status: :not_accepted
        end
    end

    def validate
        
        if logged_in
            
            render json: { user: @current_user, token: issue_token({ user_id: @current_user.id }) }
        else
            render json: { errors: ['Invalid token']}, status: :not_accepted
        end
    end

    def destroy 
        User.destroy(@current_user.id)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email)
    end

    def login_params
        params.require(:user).permit(:email, :password)
    end

end
