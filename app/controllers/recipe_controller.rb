class RecipeController < ApplicationController

    def create
        recipe = Recipe.new(recipe_params)
        puts recipe_params
        if recipe.save
            data = {recipe: recipe, message: "Success"}
            render :json => data
        else
            data = {message: "Could Not Create Recipe"}
            render :json => data
        end
    end

    def show
        recipe = Recipe.find_by(name: params[:name])
        puts params
        if recipe
            data = {message: "Success", :recipe => {ingredients: recipe.ingredients, instructions: recipe.instructions}}
            render :json => data
        else
            data = {message: "Could not retrieve recipe"}
            render :json => data
        end
    end

    def find_recipe_by_name
        list = Recipe.where("name LIKE ?", "%" + params[:name] + "%" )
        if list
            data = {message: "Success", results: list}
            render :json => data
        else
            data = {message: "Nobody here but us chickens"}
            render :json => data
        end
    end

end
