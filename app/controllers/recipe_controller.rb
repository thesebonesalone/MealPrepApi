class RecipeController < ApplicationController

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
            data = {recipe: recipe, message: "Success"}
            render :json => data
        else
            data = {message: "Could Not Create Recipe"}
            render :json => data
        end
    end

    def show
        recipe = Recipe.find_by(name: params[:id])
        if recipe
            data = {message: "Success", :recipe => {ingredients: recipe.ingredients, instructions: recipe.instructions}}
            render :json => data
        else
            data = {message: "Could not retrieve recipe"}
            render :json => data
        end
    end

end
