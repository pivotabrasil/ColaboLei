require 'resque/server'

ColaboLei::Application.routes.draw do
  mount Mercury::Engine => '/'
  mount Ckeditor::Engine => '/ckeditor'
  mount Kss::Engine => '/kss' if Rails.env.development?

  devise_for :admin_users, ActiveAdmin::Devise.config

  authenticate :admin_user do
    mount Resque::Server, :at => '/workers'
  end

  devise_for :users, sign_out_via: :get, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/users/connect/:network', to: redirect("/users/auth/%{network}"),
                                   as: 'user_omniauth_connect'
  end

  get '/usuarios/minha-conta' => 'settings#edit', as: :edit_user
  put '/usuarios' => 'settings#update', as: :update_user
  
  root  to:                      'home#index'
  get   'contato'             => 'contacts#index', as: :contacts
  match 'contato/enviar'      => 'contacts#new',   as: :new_contact

  put   'mercury_content'     => 'mercury_contents#update'
  get   'frontend/:template'  => 'frontend#show'
  get   'frontend'            => 'frontend#index'

  ActiveAdmin.routes(self)

  get    'proposta/nova'         => 'proposals#new', as: :new_proposal
  post   'proposta/criar'        => 'proposals#create', as: :create_proposal
  get    'proposta/:id/melhorar' => 'proposals#fork', as: :fork_proposal
  post   'proposta/:id/curtir'   => 'proposals#like', as: :like_proposal
  delete 'proposta/:id'          => 'proposals#destroy', as: :destroy_proposal

  delete 'proposta/:proposal_id/comentario/:id' => 'proposal_comments#destroy', as: :destroy_proposal_comment
  post   'proposta/:proposal_id/comentario'   => 'proposal_comments#create', as: :proposal_comment

  get    ':slug'             => 'proposals#show', as: :proposal
end
