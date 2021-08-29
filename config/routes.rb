Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :users
 resources :sessions
 root 'users#landing'
 get 'landing',to:'users#landing',as:'landing'
 get 'signup', to:'users#new',as:'signup'
 post 'register', to:'users#create',as:'register'
 get 'signin', to:'sessions#new', as:'signin'
 post 'login', to:'sessions#create',as:'login'
 get 'logout', to:'sessions#destroy',as:'logout'
 get 'createPost', to:'root#create',as:'createPost'
 post '/add', to:'root#add',as:'add'
 delete '/delete/:id',to:"root#delete"
 get '/update/:id',to:"root#update"
 post '/updateform', to:"root#updateform"
 get '/error', to:'root#error'

end
