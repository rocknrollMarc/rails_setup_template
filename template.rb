require "net/http"
require "net/https"
require "uri"

TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"
BOOTSTRAP_ROOT = "https://raw.github.com/twitter/bootstrap/v1.4.0"

# Downloads a file, swiching to a secure connection if the source requires it. Also creates parent directories if they do not exist.
# ==== Parameters
# * +source+ - The remote source URL.
# * +destination+ - The local file destination path.
def download_file source, destination
  say_status :download, "#{source} to #{destination}."
  uri = URI.parse source
  http = Net::HTTP.new uri.host, uri.port
  http.use_ssl = uri.scheme == "https"
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new uri.request_uri
  response = http.request request
  project_file = File.join destination_root, destination
  project_directory = File.dirname project_file
  FileUtils.mkdir_p(project_directory) unless File.exist?(project_directory)
  File.open(project_file, "w") {|file| file.write response.body}
end

# Simple Ruby Version Management (rbenv)
download_file "#{TEMPLATE_ROOT}/rails/rbenv-version.txt", ".rbenv-version"

# Configurations
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/active_record.rb", "config/initializers/active_record.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/date_time.rb", "config/initializers/date_time.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/ruby_enhancements.rb", "config/initializers/ruby_enhancements.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/system.rb", "config/initializers/system.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/validation.rb", "config/initializers/validation.rb"
development_delta = "config/environments/development.delta.rb"
download_file("#{TEMPLATE_ROOT}/rails/config/environments/development.rb", development_delta)
insert_into_file "config/environments/development.rb", open(development_delta).read, before: "\nend\n"
remove_file "#{development_delta}"

# Gems
download_file "#{TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
generate "resourcer:install"
generate "simple_form:install"
generate "rspec:install"
generate "cucumber:install --rspec"

# Controllers
download_file "#{TEMPLATE_ROOT}/rails/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/controllers/about_controller.rb", "app/controllers/about_controller.rb"
route "resource :about, controller: \"about\""
route "resource :home, controller: \"home\""
route "root to: \"home#show\""

# Helpers
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation/menu.rb", "app/helpers/navigation/menu.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation/item.rb", "app/helpers/navigation/item.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/date_time_helper.rb", "app/helpers/date_time_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/flash_helper.rb", "app/helpers/flash_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/image_helper.rb", "app/helpers/image_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation_helper.rb", "app/helpers/navigation_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/system_helper.rb", "app/helpers/system_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/template_helper.rb", "app/helpers/template_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/visitor_helper.rb", "app/helpers/visitor_helper.rb"

# Views
remove_file "public/index.html"
download_file "#{TEMPLATE_ROOT}/rails/app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/home/show.html.erb", "app/views/home/show.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/about/show.html.erb", "app/views/about/show.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/shared/menus/_visitor.html.erb", "app/views/shared/menus/_visitor.html.erb"

# Lib
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/passenger.rake", "lib/tasks/passenger.rake"
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/railroad.rake", "lib/tasks/railroad.rake"
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/deadweight.rake", "lib/tasks/deadweight.rake"

# Images
remove_file "app/assets/images/rails.png"
download_file "#{TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed-comments.png", "app/assets/images/icons/feed-comments.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed.png", "app/assets/images/icons/feed.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/jgrowl/default.png", "app/assets/images/jgrowl/default.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/main/apple-webclip.png", "app/assets/images/main/apple-webclip.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/main/spinner.gif", "app/assets/images/main/spinner.gif"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/bold.png", "app/assets/images/markitup/bold.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/code.png", "app/assets/images/markitup/code.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h1.png", "app/assets/images/markitup/h1.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h2.png", "app/assets/images/markitup/h2.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h3.png", "app/assets/images/markitup/h3.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h4.png", "app/assets/images/markitup/h4.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h5.png", "app/assets/images/markitup/h5.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/h6.png", "app/assets/images/markitup/h6.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/handle.png", "app/assets/images/markitup/handle.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/italic.png", "app/assets/images/markitup/italic.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/link.png", "app/assets/images/markitup/link.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/list-bullet.png", "app/assets/images/markitup/list-bullet.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/list-numeric.png", "app/assets/images/markitup/list-numeric.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/paragraph.png", "app/assets/images/markitup/paragraph.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/picture.png", "app/assets/images/markitup/picture.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/preview.png", "app/assets/images/markitup/preview.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/quotes.png", "app/assets/images/markitup/quotes.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/markitup/stroke.png", "app/assets/images/markitup/stroke.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_diagonals-thick_75_f3d8d8_40x40.png", "app/assets/images/ui-bg_diagonals-thick_75_f3d8d8_40x40.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_dots-small_65_a6a6a6_2x2.png", "app/assets/images/ui-bg_dots-small_65_a6a6a6_2x2.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_flat_0_333333_40x100.png", "app/assets/images/ui-bg_flat_0_333333_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_flat_65_ffffff_40x100.png", "app/assets/images/ui-bg_flat_65_ffffff_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_flat_75_ffffff_40x100.png", "app/assets/images/ui-bg_flat_75_ffffff_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_glass_55_fbf8ee_1x400.png", "app/assets/images/ui-bg_glass_55_fbf8ee_1x400.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_highlight-hard_100_eeeeee_1x100.png", "app/assets/images/ui-bg_highlight-hard_100_eeeeee_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_highlight-hard_100_f6f6f6_1x100.png", "app/assets/images/ui-bg_highlight-hard_100_f6f6f6_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-bg_highlight-soft_15_cc0000_1x100.png", "app/assets/images/ui-bg_highlight-soft_15_cc0000_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-icons_004276_256x240.png", "app/assets/images/ui-icons_004276_256x240.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-icons_cc0000_256x240.png", "app/assets/images/ui-icons_cc0000_256x240.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/ui-icons_ffffff_256x240.png", "app/assets/images/ui-icons_ffffff_256x240.png"

# Stylesheets
download_file "#{BOOTSTRAP_ROOT}/bootstrap.css", "app/assets/stylesheets/libraries/bootstrap.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/libraries/jquery-ui.css", "app/assets/stylesheets/libraries/jquery-ui.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/shared/style.css", "app/assets/stylesheets/shared/style.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/public/style.css", "app/assets/stylesheets/public/style.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.css", "app/assets/stylesheets/application.css"

# JavaScripts
download_file "http://code.jquery.com/jquery-1.7.1.js", "app/assets/javascripts/libraries/jquery.js"
download_file "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.js", "app/assets/javascripts/libraries/jquery-ui.js"
download_file "http://cachedcommons.org/cache/jquery-cookie/0.0.0/javascripts/jquery-cookie.js", "app/assets/javascripts/libraries/jquery.cookie.js"
download_file "http://cachedcommons.org/cache/jquery-blockui/2.3.3/javascripts/jquery-blockui.js", "app/assets/javascripts/libraries/jquery.blockUI.js"
download_file "http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js", "app/assets/javascripts/libraries/jquery.validate.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/libraries/jquery.jgrowl.js", "app/assets/javascripts/libraries/jquery.jgrowl.js"
download_file "https://raw.github.com/markitup/1.x/1.1.12/markitup/jquery.markitup.js", "app/assets/javascripts/libraries/jquery.markitup.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/libraries/jquery.markitup.textile.js", "app/assets/javascripts/libraries/jquery.markitup.textile.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-alerts.js", "app/assets/javascripts/libraries/bootstrap-alerts.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-buttons.js", "app/assets/javascripts/libraries/bootstrap-buttons.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-dropdown.js", "app/assets/javascripts/libraries/bootstrap-dropdown.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-modal.js", "app/assets/javascripts/libraries/bootstrap-modal.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-popover.js", "app/assets/javascripts/libraries/bootstrap-popover.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-scrollspy.js", "app/assets/javascripts/libraries/bootstrap-scrollspy.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-tabs.js", "app/assets/javascripts/libraries/bootstrap-tabs.js"
download_file "#{BOOTSTRAP_ROOT}/bootstrap-twipsy.js", "app/assets/javascripts/libraries/bootstrap-twipsy.js"
download_file "http://www.datatables.net/download/build/jquery.dataTables.js", "app/assets/javascripts/libraries/jquery.dataTables.js"
download_file "http://cachedcommons.org/cache/underscore/1.1.0/javascripts/underscore.js", "app/assets/javascripts/libraries/underscore.js"
download_file "http://www.modernizr.com/downloads/modernizr-2.0.6.js", "app/assets/javascripts/libraries/modernizr.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/shared/base.js", "app/assets/javascripts/shared/base.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"

# Doc
file "doc/README_FOR_APP", "TODO - Document your application...slacker."
download_file "#{TEMPLATE_ROOT}/rails/doc/design/site_layout.graffle", "doc/design/site_layout.graffle"

# Factories
create_file "spec/factories.rb"

# Git
git :init
download_file "#{TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
run "pre-commit install"
git config: "pre-commit.checks 'console_log, debugger'"
git add: '.'
git commit: "-n -a -m \"Applied Rails Setup Template.\""

# End
say_status :end, "Rails Template Setup Complete!"
