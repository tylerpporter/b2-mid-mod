Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  get '/parks/:id', to: 'amusement_parks#show'

end
