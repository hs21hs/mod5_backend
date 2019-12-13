class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
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

    private

    def user_params
        params.require(:user).permit(:name, :password, :email)
    end

    def login_params
        params.require(:user).permit(:email, :password)
    end

end
