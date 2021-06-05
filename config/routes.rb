Rails.application.routes.draw do

  
  get '/' => 'homepage#show'
  
  
  #ogni pagina ha il suo controller e la view associata è visualizzata pur non esistendo il controller stesso poichè eredita ApplicationController
  get '/contatti' => 'homepage#contatti'
  post '/okcontatti' => 'homepage#createcontatti'

  get '/servizi' => 'visits#servizi'
  delete '/servizi' => 'visits#destroy'
  post '/okservizi1' => 'visits#createservizi1'
  post '/okservizi2' => 'visits#createservizi2'
  post '/cambiastvis' => 'visits#altervisit'
  post :create_order, :to => 'orders#create_order'
  post '/capture_order', :to => 'orders#capture_order'

  get '/FAQ' => 'homepage#FAQ'
  get '/team' => 'homepage#team'

  get '/prenotazioni' => 'visits#prenotazioni'
  
  #sos form post e get
  get '/sos' => 'homepage#sos'
  post "/oksos" => 'homepage#createsos'
  get '/profilo' => 'homepage#profilo'
  get '/disponibilita' => 'homepage#disponibilita'
  get '/docprofile1' => 'homepage#docprofile1'
  get '/docprofile2' => 'homepage#docprofile2'
  get '/docprofile3' => 'homepage#docprofile3'
  get '/docprofile4' => 'homepage#docprofile4'
  get '/docprofile5' => 'homepage#docprofile5'
  get '/docprofile6' => 'homepage#docprofile6'
  get '/docprofile7' => 'homepage#docprofile7'
  get '/docprofile8' => 'homepage#docprofile8'

  post '/disponibilita' => 'homepage#disponibilita'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions' ,
                                    registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    mailer: 'users/mailer', 
                                    passwords: 'users/passwords', 
                                    shared: 'users/shared', 
                                    unocks: 'users/unlocks', }

  
  devise_for :doctors, controllers: {  sessions: 'doctors/sessions' ,
                                        registrations: 'doctors/registrations',
                                        confirmations: 'doctors/confirmations',
                                        mailer: 'doctors/mailer', 
                                        passwords: 'doctors/passwords', 
                                        shared: 'doctors/shared', 
                                        unocks: 'doctors/unlocks',                                       
}

  resources :users do
    resource :kids, only: [:create,:destroy]
  end
   
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
