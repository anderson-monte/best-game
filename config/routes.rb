Rails.application.routes.draw do
  devise_for :usuarios
  resources :produtos
  root 'home#inicio'
  #root 'produtos#games'
  get "home/inicio"
  
  
  get "/ferramentas/busca" => 'produtos#busca'
  get "/categoria/games" => 'produtos#games'
  get "/categoria/hardware" => 'produtos#hardware'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
