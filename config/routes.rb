Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  root 'welcome#index'
  resources :tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
