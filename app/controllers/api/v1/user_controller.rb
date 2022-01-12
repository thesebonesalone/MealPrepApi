module Api
    module V1
        class UserController < ApplicationController
            def new
            end

            def create
                user = User.new(user_params)
                if user.save
                    data = {user: user, message: "Welcome!"}
                    render :json => data
                else
                    data = {message: "Could not create user"}
                    render :json => data
                end
            end

            def login
                user = User.find_by(username: params[:username]) || User.find_by(email: params[:email])
                if user & user.authenticate(params[:password])
                    data = {user: user, message: "Welcome Back"}
                    render :json => data
                else
                    data = {message: "No Dice, Hombre"}
                    render :json => data
                end

            end

            def show
                user = User.find_by(username: params[:username])
                if user
                    data = {message: "User found", user: user}
                    render :json => data
                else
                    render :json => {message: "User not found"}
                end

            end

            def auth
                user = User.find_by(username: params[:username])&.authenticate(params[:password])
                if user
                    data = {message: "Log in Successful", user: user}
                    render :json => data
                else
                    render :json => {message: "Could not log in"}
                end
                    
            end

            private
            def user_params
                puts params
                params.permit(:username, :email, :password)
            end
        end
    end
end
