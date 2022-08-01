Rails.application.routes.draw do
  root  'pages#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  
    resources :folders do
      member do
        delete :delete_photo_attachment
      end
    end
  
end
