GITHUB_T1_ROOT = "http://github.com/aeonscope/rails_setup_template/raw/v1.2.0"

# Doc
file "doc/README_FOR_APP", "TODO - Document your application...slacker."
file "doc/design/site_layout.graffle", open("#{GITHUB_T1_ROOT}/rails/doc/design/site_layout.graffle").read

# Controllers
file "app/controllers/home_controller.rb", open("#{GITHUB_T1_ROOT}/rails/app/controllers/home_controller.rb").read
file "app/controllers/about_controller.rb", open("#{GITHUB_T1_ROOT}/rails/app/controllers/about_controller.rb").read
route "resource :about, :controller => \"about\""
route "resource :home, :controller => \"home\""
route "root :to => \"home#show\""

# Helpers
file "app/helpers/navigation/menu.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/navigation/menu.rb").read
file "app/helpers/navigation/item.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/navigation/item.rb").read
file "app/helpers/date_time_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/date_time_helper.rb").read
file "app/helpers/flash_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/flash_helper.rb").read
file "app/helpers/image_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/image_helper.rb").read
file "app/helpers/layout_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/layout_helper.rb").read
file "app/helpers/navigation_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/navigation_helper.rb").read
file "app/helpers/position_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/position_helper.rb").read
file "app/helpers/system_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/system_helper.rb").read
file "app/helpers/template_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/template_helper.rb").read
file "app/helpers/text_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/text_helper.rb").read
file "app/helpers/visitor_helper.rb", open("#{GITHUB_T1_ROOT}/rails/app/helpers/visitor_helper.rb").read

# Views
run "rm public/index.html"
file "app/views/layouts/application.html.erb", open("#{GITHUB_T1_ROOT}/rails/app/views/layouts/application.html.erb").read
file "app/views/home/show.html.erb", open("#{GITHUB_T1_ROOT}/rails/app/views/home/show.html.erb").read
file "app/views/about/show.html.erb", open("#{GITHUB_T1_ROOT}/rails/app/views/about/show.html.erb").read
file "app/views/shared/menus/_visitor.html.erb", open("#{GITHUB_T1_ROOT}/rails/app/views/shared/menus/_visitor.html.erb").read

# Lib
file "lib/acts_as_list_enhancements.rb", open("#{GITHUB_T1_ROOT}/rails/lib/acts_as_list_enhancements.rb").read
file "lib/tasks/database.rake", open("#{GITHUB_T1_ROOT}/rails/lib/tasks/database.rake").read
file "lib/tasks/heroku.rake", open("#{GITHUB_T1_ROOT}/rails/lib/tasks/heroku.rake").read
file "lib/tasks/passenger.rake", open("#{GITHUB_T1_ROOT}/rails/lib/tasks/passenger.rake").read
file "lib/tasks/railroad.rake", open("#{GITHUB_T1_ROOT}/rails/lib/tasks/railroad.rake").read
file "lib/tasks/deadweight.rake", open("#{GITHUB_T1_ROOT}/rails/lib/tasks/deadweight.rake").read

# Configurations
file "config/initializers/active_record.rb", open("#{GITHUB_T1_ROOT}/rails/config/initializers/active_record.rb").read
file "config/initializers/date_time.rb", open("#{GITHUB_T1_ROOT}/rails/config/initializers/date_time.rb").read
file "config/initializers/ruby_enhancements.rb", open("#{GITHUB_T1_ROOT}/rails/config/initializers/ruby_enhancements.rb").read
file "config/initializers/system.rb", open("#{GITHUB_T1_ROOT}/rails/config/initializers/system.rb").read
file "config/initializers/validation.rb", open("#{GITHUB_T1_ROOT}/rails/config/initializers/validation.rb").read
open("config/environments/development.rb", 'a') {|file| file << open("#{GITHUB_T1_ROOT}/rails/config/environments/development.rb").read}

# Gems
gem "rake"
gem "rails", "3.0.1"
gem "resourcer"
gem "aasm"
gem "will_paginate"
gem "formtastic"
gem "acts_as_list"
gem "lineage"
gem "RedCloth"
gem "aws-s3", :require => "aws/s3"
gem "paperclip"

gem "ruby-debug"
gem "looksee", :require => "looksee/shortcuts"
gem "wirble"
gem "hirb"
gem "awesome_print"
gem "ruby-growl"
gem "bullet", "2.0.0.rc2"
gem "silent-postgres"
gem "colorblind"
gem "deadweight"
gem "railroad"

gem "rspec-rails"
gem "cucumber"
gem "webrat"
gem "metric_fu"

generate :resourcer_setup
generate "rspec:install"
generate "cucumber:install --rspec"

# Images
run "rm -rf public/images"
file "public/favicon.ico", open("#{GITHUB_T1_ROOT}/rails/public/favicon.ico").read
file "public/themes/default/images/icons/email.gif", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/email.gif").read
file "public/themes/default/images/icons/feed-comments.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/feed-comments.png").read
file "public/themes/default/images/icons/feed.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/feed.png").read
file "public/themes/default/images/icons/unknown.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/unknown.png").read
file "public/themes/default/images/jgrowl/default.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/jgrowl/default.png").read
file "public/themes/default/images/main/apple-webclip.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/apple-webclip.png").read
file "public/themes/default/images/main/background.jpg", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/background.jpg").read
file "public/themes/default/images/main/spinner.gif", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/spinner.gif").read
file "public/themes/default/images/markitup/bold.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/bold.png").read
file "public/themes/default/images/markitup/code.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/code.png").read
file "public/themes/default/images/markitup/h1.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h1.png").read
file "public/themes/default/images/markitup/h2.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h2.png").read
file "public/themes/default/images/markitup/h3.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h3.png").read
file "public/themes/default/images/markitup/h4.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h4.png").read
file "public/themes/default/images/markitup/h5.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h5.png").read
file "public/themes/default/images/markitup/h6.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h6.png").read
file "public/themes/default/images/markitup/handle.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/handle.png").read
file "public/themes/default/images/markitup/italic.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/italic.png").read
file "public/themes/default/images/markitup/link.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/link.png").read
file "public/themes/default/images/markitup/list-bullet.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/list-bullet.png").read
file "public/themes/default/images/markitup/list-numeric.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/list-numeric.png").read
file "public/themes/default/images/markitup/paragraph.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/paragraph.png").read
file "public/themes/default/images/markitup/picture.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/picture.png").read
file "public/themes/default/images/markitup/preview.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/preview.png").read
file "public/themes/default/images/markitup/quotes.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/quotes.png").read
file "public/themes/default/images/markitup/stroke.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/stroke.png").read
file "public/themes/default/images/tooltip/large.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/tooltip/large.png").read
file "public/themes/default/images/tooltip/tiny.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/tooltip/tiny.png").read
file "public/themes/default/images/ui-bg_diagonals-thick_8_333333_40x40.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_diagonals-thick_8_333333_40x40.png").read
file "public/themes/default/images/ui-bg_flat_65_ffffff_40x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_flat_65_ffffff_40x100.png").read
file "public/themes/default/images/ui-bg_glass_40_111111_1x400.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_glass_40_111111_1x400.png").read
file "public/themes/default/images/ui-bg_glass_55_1c1c1c_1x400.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_glass_55_1c1c1c_1x400.png").read
file "public/themes/default/images/ui-bg_highlight-hard_100_f9f9f9_1x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-hard_100_f9f9f9_1x100.png").read
file "public/themes/default/images/ui-bg_highlight-hard_40_aaaaaa_1x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-hard_40_aaaaaa_1x100.png").read
file "public/themes/default/images/ui-bg_highlight-soft_50_aaaaaa_1x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-soft_50_aaaaaa_1x100.png").read
file "public/themes/default/images/ui-bg_inset-hard_45_cd0a0a_1x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_inset-hard_45_cd0a0a_1x100.png").read
file "public/themes/default/images/ui-bg_inset-hard_55_ffeb80_1x100.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_inset-hard_55_ffeb80_1x100.png").read
file "public/themes/default/images/ui-icons_222222_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_222222_256x240.png").read
file "public/themes/default/images/ui-icons_4ca300_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_4ca300_256x240.png").read
file "public/themes/default/images/ui-icons_bbbbbb_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_bbbbbb_256x240.png").read
file "public/themes/default/images/ui-icons_ededed_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ededed_256x240.png").read
file "public/themes/default/images/ui-icons_ffcf29_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ffcf29_256x240.png").read
file "public/themes/default/images/ui-icons_ffffff_256x240.png", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ffffff_256x240.png").read

# Stylesheets
file "public/themes/default/admin/ie.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/ie.css").read
file "public/themes/default/admin/screen.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/screen.css").read
file "public/themes/default/admin/style.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/style.css").read
file "public/themes/default/authorization.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/authorization.css").read
file "public/themes/default/common.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/common.css").read
file "public/themes/default/ie.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/ie.css").read
file "public/themes/default/jquery-ui.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/jquery-ui.css").read
file "public/themes/default/print.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/print.css").read
file "public/themes/default/screen.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/screen.css").read
file "public/themes/default/style.css", open("#{GITHUB_T1_ROOT}/rails/public/themes/default/style.css").read

# JavaScripts
file "public/javascripts/jquery.js", open("http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.js").read
file "public/javascripts/jquery-ui.js", open("http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.js").read
file "public/javascripts/jquery.blockUI.js", open("http://cachedcommons.org/cache/jquery-blockui/2.3.3/javascripts/jquery-blockui.js").read
file "public/javascripts/jquery.validate.js", open("http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js").read
file "public/javascripts/jquery.jgrowl.js", open("#{GITHUB_T1_ROOT}/rails/public/javascripts/jquery.jgrowl.js").read
file "public/javascripts/jquery.markitup.js", open("http://cachedcommons.org/cache/markitup/1.1.8/javascripts/markitup.js").read
file "public/javascripts/jquery.markitup.textile.js", open("#{GITHUB_T1_ROOT}/rails/public/javascripts/jquery.markitup.textile.js").read
file "public/javascripts/jquery.tools.js", open("http://cdn.jquerytools.org/1.2.5/all/jquery.tools.min.js").read
file "public/javascripts/underscore.js", open("http://cachedcommons.org/cache/underscore/1.1.0/javascripts/underscore.js").read
file "public/javascripts/modernizr.js", open("http://cachedcommons.org/cache/modernizr/1.5.0/javascripts/modernizr.js").read
file "public/javascripts/application.js", open("#{GITHUB_T1_ROOT}/rails/public/javascripts/application.js").read

# Git
git :init
file ".gitignore", open("#{GITHUB_T1_ROOT}/rails/gitignore.txt").read
git :add => '.'
git :commit => "-a -m \"Applied Rails Setup Template.\""
