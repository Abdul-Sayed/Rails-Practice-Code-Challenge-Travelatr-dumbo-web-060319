Rails.application.routes.draw do
  # get 'destinations/index'

  # get 'destinations/new'

  # get 'destinations/show'

  # get 'destinations/edit'

  # get 'posts/index'

  # get 'posts/new'

  # get 'posts/show'

  # get 'posts/edit'

  # get 'bloggers/index'

  # get 'bloggers/new'

  # get 'bloggers/show'

  # get 'bloggers/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, :only => [:index, :new, :create, :show]
  resources :posts, :only => [:index, :new, :create, :show, :edit, :update]
  resources :destinations, :only => [:index, :show]

  # Enable click event method call through custom route
  # In posts controller, make a def like method
  # post "posts/:id/method_name", to: "posts#method_name", as: "method_name"
  post "posts/:id/like", to: "posts#like", as: "like"
end
