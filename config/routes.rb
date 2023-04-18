Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/:username", to: "users#show", as: "user", username: /[^\/]+/

  get 'machines/new'
  post 'machines', to: "machines#create"
  delete 'machines/:id', to: "machines#destroy", as: "destroy_machine"
  get ':username/:name', to: "machines#show", as: "machine", username: /[^\/]+/, name: /[^\/]+/
  get ':username/:name/edit', to: "machines#edit", as: "machines_edit", username: /[^\/]+/, name: /[^\/]+/
  patch ':username/:name', to: "machines#update", as: "machines_update", username: /[^\/]+/, name: /[^\/]+/

  # Defines the root path route ("/")
  root "home#index"
end
