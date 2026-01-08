Rails.application.routes.draw do
  root "home#index"

  resources :clientes
  resources :eventos
  resources :contratos
  resources :servicios
  resources :empleados
  resources :asignaciones

  resources :reportes, only: [:index] do
    collection do
      get :clientes
      get :eventos
      get :servicios
      get :asignaciones
    end
  end

end
