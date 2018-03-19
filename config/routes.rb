Rails.application.routes.draw do
  devise_scope :admin do
    get '/admin', to: redirect('/admin/sign_up')
    get "/admin/sign_in" => "devise/sessions#new"
    get "/admin/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end

  resources :packages
  resources :trucks, only: [:index, :show, :new, :create]
  resources :fleets, only: [:index, :show, :new, :create]

  devise_for :admins

  authenticated :admin do
    root 'packages#index', as: :authenticated_root
  end

  get 'getPackageByTrackingID', to: 'trackings#lookup'
  get 'cities/:state', to: 'application#cities'
  get 'fetch_fleets/:address', to: 'application#fetch_trucks_from_fleet'
  root to: 'trackings#index'
end
