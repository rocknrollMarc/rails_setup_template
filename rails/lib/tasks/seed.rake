require File.dirname(__FILE__) + '/../../config/environment'

namespace :db do
	desc "Seeds the database with default data."
	task :seed do
		puts "Adding <table name> data..."
		puts "TODO - <model class>.create :<column> => <value>, :<column> => <value>, etc..."
	end
	
	desc "Drops, migrates, and seeds the database."
	task :reseed => [:drop, :migrate, :seed]	
end