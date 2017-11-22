Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :products
        resources :employees do
            resources :schedules
          end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end