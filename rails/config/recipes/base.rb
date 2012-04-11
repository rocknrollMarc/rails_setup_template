set :install_command, "apt-get -q -y"

def template source, target
	erb = File.read File.expand_path("../templates/#{source}", __FILE__)
	put ERB.new(erb).result(binding), target	
end

def set_default name, *args, &block
	set(name, *args, &block) unless exists? name
end

namespace :deploy do
	desc "Installs application requirements onto server."
	task :install do
		# Placeholder - Nothing to do here.
	end
end
