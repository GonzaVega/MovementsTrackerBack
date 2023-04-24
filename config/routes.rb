Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    devise_for :users, skip: [:sessions, :registrations]
    resources :users
    resources :movements do
      collection do
        get :balance
        get :income_balance
        get :expense_balance
      end
    end
    resources :units
    resources :unit_types
  end
end



# Rails routes original code. 

#Rails.application.routes.draw do
#   mount_devise_token_auth_for 'User', at: 'auth'
#   devise_for :users
#   resources :movements do
#     collection do
#       get :balance
#       get :income_balance
#       get :expense_balance
#     end

#   end
#   resources :users
#   resources :units
#   resources :unit_types
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end
