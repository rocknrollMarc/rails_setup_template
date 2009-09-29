ActionController::Routing::Routes.draw do |map|
	# REST
  map.root :controller => "public/public"
  map.namespace :public do |public|
		public.resource :about, :controller => "about"
	end

	# Defaults
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ":controller/:action/.:format"	
end
