Rails.application.routes.draw do

  get '/' => 'homepage#show'

  #per il momento ho mappato servizi nel controller di homepage
  get '/servizi' => 'homepage#servizi'
  get '/FAQ' => 'homepage#FAQ'
  
  devise_for :users, controllers: { omniauth_callbacks:
  'users/omniauth_callbacks' }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
