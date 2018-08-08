# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
#  devise_for :users,
#             controllers: { sessions: 'sessions' }, defaults: { format: :json }
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  resources :posts do
    resources :comments
  end
end
