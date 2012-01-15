require 'deadweight'

desc "Runs Deadweight. Usage: rake deadweight"
Deadweight::RakeTask.new do |dw|
  dw.root = "http://localhost:3000"
  dw.stylesheets = ["/assets/shared/style.css"]
  dw.pages = ["/"]
end
