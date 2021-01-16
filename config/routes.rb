Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :forecast do
        get '/', to: 'search#index'
      end
    end
  end
end
