ActionController::Routing::Routes.draw do |map|
	# REST
  map.root :controller => "home", :action => "show"
  map.resource :home, :controller => "home"
	map.resource :about, :controller => "about"

	# Defaults
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end