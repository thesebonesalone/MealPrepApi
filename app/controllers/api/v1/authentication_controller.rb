module Api
    module V1
        class AuthenticationController < ApplicationController
            def create
                p params
                user = User.find_by(username: params[:username])&.authenticate(params[:password])
                if user
                    render :json => {message: "Success", token: AuthenticationTokenService.call(user.id)}
                else
                    render :json => {message: "No dice"}
                end
            end

            def retrieve
                id = AuthenticationTokenService.recall(params[:token])
                user = User.find_by(id: id[0]["user_id"])
                if user
                    render :json => {message: "Success", user: {id: user.id, username: user.username}}
                else
                    render :json => {message: "No dice"}
                end
            end
        end
    end
end