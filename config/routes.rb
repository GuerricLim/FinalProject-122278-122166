Rails.application.routes.draw do
  devise_for :users
 root to: "pages#index"
 get '/about' => 'pages#about'
 resources :employees
end
