ActionController::Routing::Routes.draw do |map|

  map.resources :types

  map.resources :roles

  map.resources :statuses

  map.resources :contacts

  map.resources :users

  map.resource :session

  map.resources :projects do |projects|
    projects.resources :tasks, :has_many => :comments
  end
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
