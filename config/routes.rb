Rails.application.routes.draw do
  resources :locations, except: [:show,:edit,:update,:destroy]
  resources :car_costs, except: [:show,:destroy]
  resources :tokens 
  get 'status_search' ,  to:'tokens#status_search'
  get 'admin/admin'
  get 'approve_status', to: 'admin#approve_appointment'
  resources :models, except: [:show]
  resources :kilometer_drivens, except: [:show]
  resources :variants, except: [:show]
 
  resources :registration_years, only: [:index]
  resources :registration_states, except: [:show]
  resources :brands, except: [:show]
  resources :cities, except: [:show]
  resources :sellers do 
              collection do
                get 'search_city'
                get 'search_brand'
                get 'search_registration_year'
                get 'search_variant'
                get 'search_registration_state'
                get 'search_kilometer_driven'
                get 'search_model'
                get 'update_status'
                get 'my_add'

              end
              member do
                get :toggle_status
                get :approve
                get :reject
              end
            end
  resources :users, except: [:new,:show] do
    member do
      get 'confirm_email'
    end
  end
  get '/signup', to: 'users#new'
  root to: 'pages#home'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
