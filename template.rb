GITHUB_ROOT = "http://github.com/aeonscope/rails_setup_template/raw/v1.1.0"

# Doc
file "doc/README_FOR_APP", "TODO - You should document the application here."
file "doc/design/site_layout.graffle", open("#{GITHUB_ROOT}/rails/doc/design/site_layout.graffle").read

# Controllers
file "app/controllers/home_controller.rb", open("#{GITHUB_ROOT}/rails/app/controllers/home_controller.rb").read
file "app/controllers/about_controller.rb", open("#{GITHUB_ROOT}/rails/app/controllers/about_controller.rb").read

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
file "app/views/home/show.html.erb", open("#{GITHUB_ROOT}/rails/app/views/home/show.html.erb").read
file "app/views/about/show.html.erb", open("#{GITHUB_ROOT}/rails/app/views/about/show.html.erb").read
file "app/views/shared/menus/_visitor.html.erb", open("#{GITHUB_ROOT}/rails/app/views/shared/menus/_visitor.html.erb").read

# Lib
file "lib/tasks/database.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/database.rake").read
file "lib/tasks/heroku.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/heroku.rake").read
file "lib/tasks/passenger.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/passenger.rake").read
file "lib/tasks/railroad.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/railroad.rake").read
file "lib/tasks/deadweight.rake", open("#{GITHUB_ROOT}/rails/lib/tasks/deadweight.rake").read

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
gem "deadweight"
gem "bullet"
gem "railroad", :lib => false
gem "metric_fu"
gem "webrat", :lib => false
gem "cucumber", :lib => false
gem "rspec-rails", :lib => false
gem "rspec", :lib => false
gem "paperclip"
gem "RedCloth"
gem "will_paginate"
gem "aasm"
gem "acts_as_list"
gem "awesome_nested_set"
gem "formtastic"
gem "less"
gem "resourcer"
generate :resourcer_setup
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
file "public/themes/default/images/main/background.jpg", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/background.jpg").read
file "public/themes/default/images/main/apple-webclip.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/apple-webclip.png").read
file "public/themes/default/images/main/spinner.gif", open("#{GITHUB_ROOT}/rails/public/themes/default/images/main/spinner.gif").read
file "public/themes/default/images/icons/feed.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/feed.png").read
file "public/themes/default/images/icons/feed-comments.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/feed-comments.png").read
file "public/themes/default/images/icons/unknown.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/icons/unknown.png").read
file "public/themes/default/images/jgrowl/default.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/jgrowl/default.png").read
file "public/themes/default/images/ui-anim_basic_16x16.gif", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-anim_basic_16x16.gif").read
file "public/themes/default/images/ui-bg_flat_0_aaaaaa_40x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_flat_0_aaaaaa_40x100.png").read
file "public/themes/default/images/ui-bg_flat_75_ffffff_40x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_flat_75_ffffff_40x100.png").read
file "public/themes/default/images/ui-bg_glass_55_fbf9ee_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_55_fbf9ee_1x400.png").read
file "public/themes/default/images/ui-bg_glass_65_ffffff_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_65_ffffff_1x400.png").read
file "public/themes/default/images/ui-bg_glass_75_dadada_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_75_dadada_1x400.png").read
file "public/themes/default/images/ui-bg_glass_75_e6e6e6_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_75_e6e6e6_1x400.png").read
file "public/themes/default/images/ui-bg_glass_95_fef1ec_1x400.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_glass_95_fef1ec_1x400.png").read
file "public/themes/default/images/ui-bg_highlight-soft_75_cccccc_1x100.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-bg_highlight-soft_75_cccccc_1x100.png").read
file "public/themes/default/images/ui-icons_222222_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_222222_256x240.png").read
file "public/themes/default/images/ui-icons_2e83ff_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_2e83ff_256x240.png").read
file "public/themes/default/images/ui-icons_454545_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_454545_256x240.png").read
file "public/themes/default/images/ui-icons_888888_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_888888_256x240.png").read
file "public/themes/default/images/ui-icons_cd0a0a_256x240.png", open("#{GITHUB_ROOT}/rails/public/themes/default/images/ui-icons_cd0a0a_256x240.png").read

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
file "public/javascripts/jquery.js", open("http://code.jquery.com/jquery-1.4.2.js").read
file "public/javascripts/jquery-ui.js", open("http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.js").read
file "public/javascripts/jquery.blockUI.js", open("http://github.com/malsup/blockui/raw/master/jquery.blockUI.js").read
file "public/javascripts/jquery.validate.js", open("#{GITHUB_ROOT}/rails/public/javascripts/jquery.validate.js").read
file "public/javascripts/jquery.jgrowl.js", open("#{GITHUB_ROOT}/rails/public/javascripts/jquery.jgrowl.js").read
file "public/javascripts/underscore.js", open("http://github.com/documentcloud/underscore/raw/master/underscore.js").read
file "public/javascripts/application.js", open("#{GITHUB_ROOT}/rails/public/javascripts/application.js").read

# Tests
run "rm -rf test"

# Git
git :init
file ".gitignore", open("#{GITHUB_ROOT}/rails/gitignore.txt").read
git :add => '.'
