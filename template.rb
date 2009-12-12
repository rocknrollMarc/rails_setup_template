GITHUB_ROOT = "http://github.com/aeonscope/rails_setup_template/raw/master"

# Doc
file "doc/README_FOR_APP", "TODO - Describe the details of this application."
file "doc/design/site_layout.graffle", open("#{GITHUB_ROOT}/rails/doc/design/site_layout.graffle").read

# Controllers
file "app/controllers/visitor/visitor_controller.rb", open("#{GITHUB_ROOT}/rails/app/controllers/visitor/visitor_controller.rb").read
file "app/controllers/visitor/about_controller.rb", open("#{GITHUB_ROOT}/rails/app/controllers/visitor/about_controller.rb").read

# Helpers
file "app/helpers/renderers/menu_item.rb", open("#{GITHUB_ROOT}/rails/app/helpers/renderers/menu_item.rb").read 
file "app/helpers/system_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/system_helper.rb").read
file "app/helpers/date_time_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/date_time_helper.rb").read
file "app/helpers/layout_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/layout_helper.rb").read
file "app/helpers/navigation_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/navigation_helper.rb").read
file "app/helpers/flash_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/flash_helper.rb").read
file "app/helpers/text_helper.rb", open("#{GITHUB_ROOT}/rails/app/helpers/text_helper.rb").read

# Views
run "rm public/index.html"
file "app/views/layouts/application.html.erb", open("#{GITHUB_ROOT}/rails/app/views/layouts/application.html.erb").read
file "app/views/visitor/visitor/index.html.erb", open("#{GITHUB_ROOT}/rails/app/views/visitor/visitor/index.html.erb").read
file "app/views/visitor/about/show.html.erb", open("#{GITHUB_ROOT}/rails/app/views/visitor/about/show.html.erb").read
file "app/views/shared/menus/_visitor.html.erb", open("#{GITHUB_ROOT}/rails/app/views/shared/menus/_visitor.html.erb").read

# Lib
file "lib/tasks/seed.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/seed.rake").read
file "lib/tasks/railroad.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/railroad.rake").read

# Configurations
file "config/routes.rb", open("#{GITHUB_ROOT}/rails/config/routes.rb").read
file "config/initializers/active_record.rb", open("#{GITHUB_ROOT}/rails/config/initializers/active_record.rb").read
file "config/initializers/date_time.rb", open("#{GITHUB_ROOT}/rails/config/initializers/date_time.rb").read
file "config/initializers/system.rb", open("#{GITHUB_ROOT}/rails/config/initializers/system.rb").read
file "config/initializers/validation.rb", open("#{GITHUB_ROOT}/rails/config/initializers/validation.rb").read
open("config/environments/development.rb", 'a') do |file|
  file << open("#{GITHUB_ROOT}/rails/config/environments/development.rb").read
end

# Gems
gem "bullet", :source => "http://gemcutter.org"
gem "railroad", :lib => false
gem "jscruggs-metric_fu", :lib => "metric_fu", :source => "http://gems.github.com"
gem "webrat", :lib => false, :source => "http://gems.github.com"
gem "cucumber", :lib => false, :source => "http://gems.github.com"
gem "rspec-rails", :lib => false, :source => "http://gems.github.com"
gem "rspec", :lib => false, :source => "http://gems.github.com"
gem "thoughtbot-paperclip", :lib => "paperclip", :source => "http://gems.github.com"
gem "RedCloth"
gem "mislav-will_paginate", :lib => "will_paginate", :source => "http://gems.github.com"
gem "rubyist-aasm", :lib => "aasm", :source => "http://gems.github.com"
gem "ancestry", :source => "http://gemcutter.org"
gem "acts_as_list", :source => "http://gemcutter.org"
gem "formtastic", :source => "http://gemcutter.org"
gem "cloudhead-less", :lib => "less", :source => "http://gems.github.com"
gem "aeonscope-rest", :lib => "rest", :source => "http://gems.github.com"
generate :rest_setup
generate :rspec
generate :cucumber

# Plugins
plugin "More", :git => "git://github.com/cloudhead/more.git"
plugin "Custom Error Message", :git => "git://github.com/gumayunov/custom-err-msg.git"
plugin "Blue Ridge", :git => "git://github.com/relevance/blue-ridge.git"
plugin "Rails Indexes", :git => "git://github.com/eladmeidar/rails_indexes.git"
generate :blue_ridge

# Images
run "rm -rf public/images"
file "public/favicon.ico", open("#{GITHUB_ROOT}/rails/public/favicon.ico").read
file "public/themes/default/images/main/background.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/background.png").read
file "public/themes/default/images/main/apple-webclip.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/apple-webclip.png").read
file "public/themes/default/images/main/spinner.gif", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/spinner.gif").read
file "public/themes/default/images/icons/feed.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/feed.png").read
file "public/themes/default/images/icons/feed-comments.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/feed-comments.png").read
file "public/themes/default/images/icons/unknown.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/unknown.png").read
file "public/themes/default/images/jgrowl/default.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/jgrowl/default.png").read
file "public/themes/default/images/ui-bg_flat_55_999999_40x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_flat_55_999999_40x100.png").read
file "public/themes/default/images/ui-bg_flat_75_aaaaaa_40x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_flat_75_aaaaaa_40x100.png").read
file "public/themes/default/images/ui-bg_glass_45_0078ae_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_45_0078ae_1x400.png").read
file "public/themes/default/images/ui-bg_glass_55_f8da4e_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_55_f8da4e_1x400.png").read
file "public/themes/default/images/ui-bg_glass_75_79c9ec_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_75_79c9ec_1x400.png").read
file "public/themes/default/images/ui-bg_gloss-wave_45_e14f1c_500x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_gloss-wave_45_e14f1c_500x100.png").read
file "public/themes/default/images/ui-bg_gloss-wave_50_6eac2c_500x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_gloss-wave_50_6eac2c_500x100.png").read
file "public/themes/default/images/ui-bg_gloss-wave_75_2191c0_500x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_gloss-wave_75_2191c0_500x100.png").read
file "public/themes/default/images/ui-bg_inset-hard_100_fcfdfd_1x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_inset-hard_100_fcfdfd_1x100.png").read
file "public/themes/default/images/ui-icons_0078ae_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_0078ae_256x240.png").read
file "public/themes/default/images/ui-icons_056b93_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_056b93_256x240.png").read
file "public/themes/default/images/ui-icons_d8e7f3_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_d8e7f3_256x240.png").read
file "public/themes/default/images/ui-icons_e0fdff_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_e0fdff_256x240.png").read
file "public/themes/default/images/ui-icons_f5e175_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_f5e175_256x240.png").read
file "public/themes/default/images/ui-icons_f7a50d_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_f7a50d_256x240.png").read
file "public/themes/default/images/ui-icons_fcd113_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_fcd113_256x240.png").read

# Stylesheets
file "public/themes/default/screen.css", open("#{GITHUB_ROOT}/rails/public/themes/default/screen.css").read
file "public/themes/default/print.css", open("#{GITHUB_ROOT}/rails/public/themes/default/print.css").read
file "public/themes/default/ie.css", open("#{GITHUB_ROOT}/rails/public/themes/default/ie.css").read

# Themes
file "public/themes/default/style.css", open("#{GITHUB_ROOT}/rails/public/themes/default/style.css").read
file "public/themes/default/jquery-ui.css", open("#{GITHUB_ROOT}/rails/public/themes/default/jquery-ui.css").read

# JavaScripts
run "rm public/javascripts/controls.js"
run "rm public/javascripts/dragdrop.js"
run "rm public/javascripts/effects.js"
run "rm public/javascripts/prototype.js"
file "public/javascripts/jquery.js", open("http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js").read
file "public/javascripts/jquery-ui.js", open("http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.js").read
file "public/javascripts/jquery.validate.js", open("#{GITHUB_ROOT}/rails/public/javascripts/jquery.validate.js").read
file "public/javascripts/jquery.tablesorter.js", open("http://tablesorter.com/jquery.tablesorter.js").read
file "public/javascripts/jquery.blockUI.js", open("http://github.com/malsup/blockui/raw/master/jquery.blockUI.js").read
file "public/javascripts/jquery.jgrowl.js", open("#{GITHUB_ROOT}/rails/public/javascripts/jquery.jgrowl.js").read
file "public/javascripts/underscore.js", open("http://github.com/documentcloud/underscore/raw/master/underscore.js").read
file "public/javascripts/application.js", open("#{GITHUB_ROOT}/rails/public/javascripts/application.js").read

# Tests
run "rm -rf test"

# Git
git :init
file ".gitignore", open("#{GITHUB_ROOT}/rails/gitignore.txt").read
git :add => '.'
