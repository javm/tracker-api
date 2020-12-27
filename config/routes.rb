Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'status/:provider', to: 'tracker#status'
  get 'track/:provider', to: 'tracker#track'
end
