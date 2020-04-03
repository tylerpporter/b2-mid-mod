Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  patch '/mechanics/:id', to: 'mechanics#update_rides'

  get '/parks/:id', to: 'amusement_parks#show'

end
