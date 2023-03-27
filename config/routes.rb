Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/:username", to: "users#show", as: "user"

  get 'machines/new'
  post 'machines/create'
  delete 'machines/destroy'
  get ':username/:name', to: "machines#show", as: "machine"
  get ':username/:name/edit', to: "machines#edit", as: "edit_machine"
  patch ':username/:name/update', to: "machines#update", as: "update_machine"

  # Defines the root path route ("/")
  root "home#index"
end
