namespace :doc do
	namespace :diagram do
		desc "Creates the doc/design directory (if it does not already exist)."
		task :setup do
			design = File.join(RAILS_ROOT, 'doc', 'design')
			FileUtils.mkdir design unless File.exists?(design)
		end

		desc "Creates/updates the models diagram."
		task :models => [:setup] do
			models = File.join RAILS_ROOT, 'doc', 'design', 'models.dot'
			FileUtils.rm_f models
			sh "railroad -i -l -a -m -o #{models} -M"
		end

		desc "Creates/updates the controllers diagram."
		task :controllers => [:setup] do
			controllers = File.join RAILS_ROOT, 'doc', 'design', 'controllers.dot'
			FileUtils.rm_f controllers
			sh "railroad -i -l -o #{controllers} -C"
		end

		desc "Creates/updates the Acts as State Machine (AASM) diagram."
		task :aasm => [:setup] do
			aasm = File.join RAILS_ROOT, 'doc', 'design', 'aasm.dot'
			FileUtils.rm_f aasm
			sh "railroad -l -o #{aasm} -A"
		end
	end

	desc "Creates/updates both the model and controller diagrams."
	task :diagrams => %w(diagram:models diagram:controllers)
end
