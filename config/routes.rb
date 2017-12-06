Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  resources :projects do
  	 resources :floorplans
  end

  authenticated :user do
  	root 'projects#index', as: "authenticated_root"
  end

  root "welcome#index"
end
