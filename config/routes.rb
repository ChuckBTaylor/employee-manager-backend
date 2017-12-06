Rails.application.routes.draw do

  post '/api/v1/login', to: 'application#login'
  get 'api/v1/companies/:id/master_schedule', to: 'api/v1/companies#master_schedule'
  get 'api/v1/companies/:company_id/operations/week/:planner_id', to: 'api/v1/operations#get_week'
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :services
        resources :clients
        resources :planners
        resources :projects
        resources :pieces
        resources :planners_procedures
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
