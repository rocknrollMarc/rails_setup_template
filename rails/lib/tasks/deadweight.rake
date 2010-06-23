require 'deadweight'

desc "Runs Deadweight"
Deadweight::RakeTask.new do |dw|
  dw.root = "http://demo.local"
  dw.stylesheets = ["#{THEME_ROOT}/style.css"]
  dw.pages = ["/"]
end
