Rails.application.routes.draw do
  
 
  get 'comments/new'

  get 'comments/index'

  get 'comments/edit'

  get 'users/about', to: 'users#about' ,as: "user_about"

  devise_for :users
  resources :posts 
  resources :comments 
  resources :relationships

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
