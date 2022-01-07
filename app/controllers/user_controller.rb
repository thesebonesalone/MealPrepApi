class UserController < ApplicationController
    def new
    end

    def create
        user = User.new(
            username: params[:username],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )
        if user.save
            data = {user: user, message: "Welcome!"}
            render :json => data
        else
            data = {message: "Could not create user"}
            render :json => data
        end
    end
end
