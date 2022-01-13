module Api
    module V1
        class IngredientController < ApplicationController
            
            def create
                ing = Ingredient.new(params)
                if ing.save
                    data = {ingredient: ing, message: "Success"}
                    render :json => data
                else
                    data = {message: "Could Not Create Ingredient"}
                    render :json => data
                end
            end

            def show
                ing = Ingredient.find_by(id: params[:id])
                if ing
                    data = {message: "Success", ingredient: ing}
                    render :json => data
                else
                    data = {message: "Ingredient Not Found"}
                    render :json => data
                end
            end

            def query_ingredients
                list = Ingredient.where("name LIKE ?", "%" + params[:name] + "%").limit(5)
                if list
                    data = {message: "Success", results: list}
                    render :json => data
                else
                    data = {message: "None"}
                    render :json => data
                end
            end
            
        end
    end
end
