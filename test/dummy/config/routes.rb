Dummy::Application.routes.draw do
  match 'login' => 'login#new'

  resources :jobs
end
