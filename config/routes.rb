Rails.application.routes.draw do
  resources :civilizations, except: [:create, :edit, :destroy] do
    resources :armies, except: [:destroy, :update, :edit]
  end
  get '/atacar', to: 'armies#atacar', as: :armies_index
  resources :uniteds
  get '/entrenamiento', to: 'army_uniteds#entrenamiento', as: :army_uniteds_entrenamiento
  get '/transformacion', to: 'transformations#index', as: :transformations_index
  post '/transformacion_update', to: 'transformations#update', as: :transformations_update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
