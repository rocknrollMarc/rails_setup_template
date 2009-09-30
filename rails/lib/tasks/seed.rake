require File.dirname(__FILE__) + '/../../config/environment'

namespace :db do
	desc "Drops, migrates, and seeds the database."
	task :reseed => [:drop, :migrate, :seed]	
end
