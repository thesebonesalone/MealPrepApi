Rails.application.routes.draw do
  get '/recipe/show/:name', to: 'recipe#show'
  get '/recipe/search/:name', to: 'recipe#find_recipe_by_name'
  post '/recipe', to: 'recipe#create'
  post '/instruction', to: 'instruction#create'
end
