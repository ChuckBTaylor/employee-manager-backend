Rails.application.routes.draw do
  resources :procedures
  get 'api/v1/companies/:id/master_schedule', to: 'api/v1/companies#master_schedule'
  get 'api/v1/companies/:id/all_projects', to: 'api/v1/companies#all_projects'
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :services
        resources :clients do
          resources :projects do
            resources :pieces
          end
        end
        resources :employees do
          resources :schedules
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
