Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/:username", to: "users#show", as: "user"

  get 'machines/new'
  post 'machines', to: "machines#create"
  delete 'machines/:id', to: "machines#destroy", as: "destroy_machine"
  get ':username/:name', to: "machines#show", as: "machine"
  get ':username/:name/edit', to: "machines#edit", as: "machines_edit"
  patch ':username/:name', to: "machines#update", as: "machines_update"

  # Defines the root path route ("/")
  root "home#index"
end
