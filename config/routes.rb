Rails.application.routes.draw do
  devise_for :users
  get 'index', to: "welcome#index"
end
