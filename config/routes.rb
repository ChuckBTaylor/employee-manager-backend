Rails.application.routes.draw do

  resources :operations_planners
  get 'api/v1/companies/:id/master_schedule', to: 'api/v1/companies#master_schedule'
  post 'api/v1/companies/:company_id/planners/:id/add_project', to: 'api/v1/planners#add_project'
  delete 'api/v1/companies/:company_id/planners/:id/remove_project', to: 'api/v1/planners#remove_project'
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :services
        resources :clients
        resources :planners
        resources :projects
        resources :pieces
        resources :procedures
        resources :operations
        resources :employees do
          resources :schedules
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
