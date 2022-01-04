Rails.application.routes.draw do
  get '/recipe/show/:name'
  post '/recipe' to: 'recipe#create'
  post '/instruction' to: 'instruction#create'
end
