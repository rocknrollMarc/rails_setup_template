ActionController::Routing::Routes.draw do |map|
	# REST
  map.root :controller => "visitor/visitor"
  map.namespace :visitor do |visitor|
		visitor.resource :about, :controller => "about"
	end

	# Defaults
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ":controller/:action/.:format"	
end
