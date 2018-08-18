Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index approve lock unlock] do
    member do
      get 'approve'
      get 'lock'
      get 'unlock'
    end
  end

  resources :leaders
  resources :carer_to_children, only: %i[new create]
  resources :jobs
  resources :how_heards, only: %i[index new show create edit update]
  resources :how_contacts, only: %i[index new show create edit update]
  resources :what_contacts, only: %i[index new show create edit update]

  resources :meet_types do
    resources :rotas, only: [:index]
  end
  resources :rotas

  resources :children do
    member do
      get 'add_carer'
      get 'new', as: :copy
    end
  end

  resources :carers do
    get 'add_child', on: :member
  end

  resources :meets do
    resources :register_children, only: [:new, :create]
    resources :register_carers, only: [:new, :create]
    resources :register_leaders, only: [:new, :create]

    get 'register', on: :member
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index'

end
