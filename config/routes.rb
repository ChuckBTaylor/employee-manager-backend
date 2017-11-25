Rails.application.routes.draw do

  get 'api/v1/companies/:id/master_schedule', to: 'api/v1/companies#master_schedule'
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :services
        resources :clients do
          resources :projects
        end
        resources :employees do
          resources :schedules
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
