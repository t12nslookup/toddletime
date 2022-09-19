# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)                                                        devise/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)                                                            devise/confirmations#show
#                           POST   /users/confirmation(.:format)                                                            devise/confirmations#create
#              approve_user GET    /users/:id/approve(.:format)                                                             users#approve
#                 lock_user GET    /users/:id/lock(.:format)                                                                users#lock
#               unlock_user GET    /users/:id/unlock(.:format)                                                              users#unlock
#                     users GET    /users(.:format)                                                                         users#index
#                   leaders GET    /leaders(.:format)                                                                       leaders#index
#                           POST   /leaders(.:format)                                                                       leaders#create
#                new_leader GET    /leaders/new(.:format)                                                                   leaders#new
#               edit_leader GET    /leaders/:id/edit(.:format)                                                              leaders#edit
#                    leader GET    /leaders/:id(.:format)                                                                   leaders#show
#                           PATCH  /leaders/:id(.:format)                                                                   leaders#update
#                           PUT    /leaders/:id(.:format)                                                                   leaders#update
#                           DELETE /leaders/:id(.:format)                                                                   leaders#destroy
#         carer_to_children POST   /carer_to_children(.:format)                                                             carer_to_children#create
#        new_carer_to_child GET    /carer_to_children/new(.:format)                                                         carer_to_children#new
#                      jobs GET    /jobs(.:format)                                                                          jobs#index
#                           POST   /jobs(.:format)                                                                          jobs#create
#                   new_job GET    /jobs/new(.:format)                                                                      jobs#new
#                  edit_job GET    /jobs/:id/edit(.:format)                                                                 jobs#edit
#                       job GET    /jobs/:id(.:format)                                                                      jobs#show
#                           PATCH  /jobs/:id(.:format)                                                                      jobs#update
#                           PUT    /jobs/:id(.:format)                                                                      jobs#update
#                           DELETE /jobs/:id(.:format)                                                                      jobs#destroy
#                how_heards GET    /how_heards(.:format)                                                                    how_heards#index
#                           POST   /how_heards(.:format)                                                                    how_heards#create
#             new_how_heard GET    /how_heards/new(.:format)                                                                how_heards#new
#            edit_how_heard GET    /how_heards/:id/edit(.:format)                                                           how_heards#edit
#                 how_heard GET    /how_heards/:id(.:format)                                                                how_heards#show
#                           PATCH  /how_heards/:id(.:format)                                                                how_heards#update
#                           PUT    /how_heards/:id(.:format)                                                                how_heards#update
#              how_contacts GET    /how_contacts(.:format)                                                                  how_contacts#index
#                           POST   /how_contacts(.:format)                                                                  how_contacts#create
#           new_how_contact GET    /how_contacts/new(.:format)                                                              how_contacts#new
#          edit_how_contact GET    /how_contacts/:id/edit(.:format)                                                         how_contacts#edit
#               how_contact GET    /how_contacts/:id(.:format)                                                              how_contacts#show
#                           PATCH  /how_contacts/:id(.:format)                                                              how_contacts#update
#                           PUT    /how_contacts/:id(.:format)                                                              how_contacts#update
#             what_contacts GET    /what_contacts(.:format)                                                                 what_contacts#index
#                           POST   /what_contacts(.:format)                                                                 what_contacts#create
#          new_what_contact GET    /what_contacts/new(.:format)                                                             what_contacts#new
#         edit_what_contact GET    /what_contacts/:id/edit(.:format)                                                        what_contacts#edit
#              what_contact GET    /what_contacts/:id(.:format)                                                             what_contacts#show
#                           PATCH  /what_contacts/:id(.:format)                                                             what_contacts#update
#                           PUT    /what_contacts/:id(.:format)                                                             what_contacts#update
#        deliver_send_email GET    /send_emails/:id/deliver(.:format)                                                       send_emails#deliver
#               send_emails GET    /send_emails(.:format)                                                                   send_emails#index
#                           POST   /send_emails(.:format)                                                                   send_emails#create
#            new_send_email GET    /send_emails/new(.:format)                                                               send_emails#new
#           edit_send_email GET    /send_emails/:id/edit(.:format)                                                          send_emails#edit
#                send_email GET    /send_emails/:id(.:format)                                                               send_emails#show
#                           PATCH  /send_emails/:id(.:format)                                                               send_emails#update
#                           PUT    /send_emails/:id(.:format)                                                               send_emails#update
#         deliver_send_text GET    /send_texts/:id/deliver(.:format)                                                        send_texts#deliver
#                send_texts GET    /send_texts(.:format)                                                                    send_texts#index
#                           POST   /send_texts(.:format)                                                                    send_texts#create
#             new_send_text GET    /send_texts/new(.:format)                                                                send_texts#new
#            edit_send_text GET    /send_texts/:id/edit(.:format)                                                           send_texts#edit
#                 send_text GET    /send_texts/:id(.:format)                                                                send_texts#show
#                           PATCH  /send_texts/:id(.:format)                                                                send_texts#update
#                           PUT    /send_texts/:id(.:format)                                                                send_texts#update
#           meet_type_rotas GET    /meet_types/:meet_type_id/rotas(.:format)                                                rotas#index
#     meet_type_send_emails POST   /meet_types/:meet_type_id/send_emails(.:format)                                          send_emails#create
#  new_meet_type_send_email GET    /meet_types/:meet_type_id/send_emails/new(.:format)                                      send_emails#new
#      meet_type_send_texts POST   /meet_types/:meet_type_id/send_texts(.:format)                                           send_texts#create
#   new_meet_type_send_text GET    /meet_types/:meet_type_id/send_texts/new(.:format)                                       send_texts#new
#                meet_types GET    /meet_types(.:format)                                                                    meet_types#index
#                           POST   /meet_types(.:format)                                                                    meet_types#create
#             new_meet_type GET    /meet_types/new(.:format)                                                                meet_types#new
#            edit_meet_type GET    /meet_types/:id/edit(.:format)                                                           meet_types#edit
#                 meet_type GET    /meet_types/:id(.:format)                                                                meet_types#show
#                           PATCH  /meet_types/:id(.:format)                                                                meet_types#update
#                           PUT    /meet_types/:id(.:format)                                                                meet_types#update
#                           DELETE /meet_types/:id(.:format)                                                                meet_types#destroy
#                     rotas GET    /rotas(.:format)                                                                         rotas#index
#                           POST   /rotas(.:format)                                                                         rotas#create
#                  new_rota GET    /rotas/new(.:format)                                                                     rotas#new
#                 edit_rota GET    /rotas/:id/edit(.:format)                                                                rotas#edit
#                      rota GET    /rotas/:id(.:format)                                                                     rotas#show
#                           PATCH  /rotas/:id(.:format)                                                                     rotas#update
#                           PUT    /rotas/:id(.:format)                                                                     rotas#update
#                           DELETE /rotas/:id(.:format)                                                                     rotas#destroy
#           add_carer_child GET    /children/:id/add_carer(.:format)                                                        children#add_carer
#                copy_child GET    /children/:id/new(.:format)                                                              children#new
#                  children GET    /children(.:format)                                                                      children#index
#                           POST   /children(.:format)                                                                      children#create
#                 new_child GET    /children/new(.:format)                                                                  children#new
#                edit_child GET    /children/:id/edit(.:format)                                                             children#edit
#                     child GET    /children/:id(.:format)                                                                  children#show
#                           PATCH  /children/:id(.:format)                                                                  children#update
#                           PUT    /children/:id(.:format)                                                                  children#update
#                           DELETE /children/:id(.:format)                                                                  children#destroy
#           add_child_carer GET    /carers/:id/add_child(.:format)                                                          carers#add_child
#                    carers GET    /carers(.:format)                                                                        carers#index
#                           POST   /carers(.:format)                                                                        carers#create
#                 new_carer GET    /carers/new(.:format)                                                                    carers#new
#                edit_carer GET    /carers/:id/edit(.:format)                                                               carers#edit
#                     carer GET    /carers/:id(.:format)                                                                    carers#show
#                           PATCH  /carers/:id(.:format)                                                                    carers#update
#                           PUT    /carers/:id(.:format)                                                                    carers#update
#                           DELETE /carers/:id(.:format)                                                                    carers#destroy
#    meet_register_children POST   /meets/:meet_id/register_children(.:format)                                              register_children#create
#   new_meet_register_child GET    /meets/:meet_id/register_children/new(.:format)                                          register_children#new
#      meet_register_carers POST   /meets/:meet_id/register_carers(.:format)                                                register_carers#create
#   new_meet_register_carer GET    /meets/:meet_id/register_carers/new(.:format)                                            register_carers#new
#     meet_register_leaders POST   /meets/:meet_id/register_leaders(.:format)                                               register_leaders#create
#  new_meet_register_leader GET    /meets/:meet_id/register_leaders/new(.:format)                                           register_leaders#new
#             register_meet GET    /meets/:id/register(.:format)                                                            meets#register
#   medical_conditions_meet GET    /meets/:id/medical_conditions(.:format)                                                  meets#medical_conditions
#                     meets GET    /meets(.:format)                                                                         meets#index
#                           POST   /meets(.:format)                                                                         meets#create
#                  new_meet GET    /meets/new(.:format)                                                                     meets#new
#                 edit_meet GET    /meets/:id/edit(.:format)                                                                meets#edit
#                      meet GET    /meets/:id(.:format)                                                                     meets#show
#                           PATCH  /meets/:id(.:format)                                                                     meets#update
#                           PUT    /meets/:id(.:format)                                                                     meets#update
#                           DELETE /meets/:id(.:format)                                                                     meets#destroy
#         letter_opener_web        /letter_opener                                                                           LetterOpenerWeb::Engine
#                      root GET    /                                                                                        welcome#index
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

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
  resources :send_emails, only: %i[index new show create edit update] do
    get :deliver, on: :member
  end
  resources :send_texts, only: %i[index new show create edit update] do
    get :deliver, on: :member
  end

  resources :meet_types do
    resources :rotas, only: %i[index]
    resources :send_emails, only: %i[new create]
    resources :send_texts, only: %i[new create]
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
    resources :register_children, only: %i[new create]
    resources :register_carers, only: %i[new create]
    resources :register_leaders, only: %i[new create]

    get 'register', on: :member
    get 'medical_conditions', on: :member
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index'
end
