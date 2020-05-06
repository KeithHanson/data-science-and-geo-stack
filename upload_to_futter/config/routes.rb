Rails.application.routes.draw do
  root 'uploads#form'

  get '/form', to: 'uploads#form'
  post '/submit', to: 'uploads#submit'
end
