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
end
