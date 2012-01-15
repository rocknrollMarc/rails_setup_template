require 'deadweight'

desc "Runs Deadweight"
Deadweight::RakeTask.new do |dw|
  dw.root = "http://demo.dev"
  dw.stylesheets = Dir["app/assets/stylesheets/**/*", "vendor/assets/stylesheets/**/*"]
  dw.pages = ["/"]
end
