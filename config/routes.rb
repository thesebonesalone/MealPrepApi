Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/recipe/show/:id', to: 'recipe#show'
      get '/recipe/search/:name', to: 'recipe#find_recipe_by_name'

      get '/ingredient/show/:id', to: 'ingredient#show'
      get '/ingredient/search/:name', to: 'ingredient#query_ingredients'
      
      post '/recipe', to: 'recipe#create'
      post '/instruction', to: 'instruction#create'

      get '/signup' => 'user#new'
      post '/user' => 'user#create'
      get '/user/show/"username' => 'user#show'
      post '/auth' => 'authentication#create'
      post '/retrieve' => 'authentication#retrieve'
    end
  end
end
