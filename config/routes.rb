Rails.application.routes.draw do
  devise_for :users
  resources :movements do
    collection do
      get :balance
      get :income_balance
      get :expense_balance
    end

  end
  resources :users
  resources :units
  resources :unit_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
