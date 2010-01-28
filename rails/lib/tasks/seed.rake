require File.dirname(__FILE__) + '/../../config/environment'

namespace :db do
	desc "Drops, migrates, and seeds the database including the rebuilding of model diagrams."
	task :reseed => [:drop, :create, :migrate, :seed, "doc:diagram:models"]
end
