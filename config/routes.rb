Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # namespace :users do
      #   post '/', to: 'users#create'
      # end
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get '/munchies', to: 'munchies#show'
      namespace :forecast do
        get '/', to: 'search#show'
      end
      namespace :backgrounds do
        get '/', to: 'search#show'
      end
    end
  end
end
