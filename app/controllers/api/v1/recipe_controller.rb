module Api
    module V1
        class RecipeController < ApplicationController

            def create
                recipe = Recipe.new
                recipe.name = params[:recipe][:name]
                recipe.user = User.find_by(id: params[:user_id])
                if recipe.save
                    params[:instructions].map{|item|
                    ii = Instruction.new()
                    ii.description = item
                    ii.recipe = recipe
                    ii.save}

                    params[:ingredients].map{|item|
                        ii = Ingredient.find_by(id: item[:id])
                        if ii == nil
                            ii = Ingredient.new()
                            ii.name = item[:name]
                            ii.calories = item[:calories]
                            ii.fat = item[:fat]
                            ii.protein = item[:protein]
                            ii.carbs = item[:carbs]
                            ii.serving_type = item[:serving_type]
                            ii.serving_size = item[:serving_size]
                            ii.meat = item[:meat]
                            ii.fish = item[:fish]
                            ii.dairy = item[:dairy]
                            ii.nonvegan = item[:nonvegan]
                            ii.haram = item[:haram]
                            ii.trefah = item[:trefah]
                            ii.save
                        end
                        ri = RecipeIngredient.new
                        ri.recipe = recipe
                        ri.ingredient = ii
                        ri.save}
                    data = {message: "Success", recipe: recipe}
                    render :json => data
                    
                else
                    data = {message: "Could Not Create Recipe"}
                    render :json => data
                end
            end

            def grab_recipe(recipe)
                return {recipe: recipe, ingredients: recipe.ingredients, instructions: recipe.instructions}
            end


            def shownew
                recipes = Recipe.order(created_at: :desc).map{|recipe| 
                grab_recipe(recipe)}
                render :json => {recipes: recipes, message: "Newest Recipes"}
            end

            def show
                recipe = Recipe.find_by(id: params[:id])
                puts params
                if recipe
                    data = {message: "Success", :recipe => {recipe: recipe, ingredients: recipe.ingredients, instructions: recipe.instructions}}
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
    end
end
