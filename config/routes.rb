Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/:username", to: "users#show", as: "user_path"

  get 'machines/new'
  post 'machines/create'
  delete 'machines/destroy'
  get ':username/:name', to: "machines#show"
  get ':username/:name/edit', to: "machines#edit"
  patch ':username/:name/update', to: "machines#update"

  # Defines the root path route ("/")
  root "home#index"
end
