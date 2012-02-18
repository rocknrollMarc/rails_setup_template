require "net/http"
require "net/https"
require "uri"

TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"
BOOTSTRAP_ROOT = "https://raw.github.com/twitter/bootstrap/v2.0.0"

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

# Lib
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/passenger.rake", "lib/tasks/passenger.rake"
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/railroad.rake", "lib/tasks/railroad.rake"
download_file "#{TEMPLATE_ROOT}/rails/lib/tasks/deadweight.rake", "lib/tasks/deadweight.rake"

# Images
remove_file "app/assets/images/rails.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_diagonals-thick_75_f3d8d8_40x40.png", "vendor/assets/images/jquery-ui/ui-bg_diagonals-thick_75_f3d8d8_40x40.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_dots-small_65_a6a6a6_2x2.png", "vendor/assets/images/jquery-ui/ui-bg_dots-small_65_a6a6a6_2x2.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_flat_0_333333_40x100.png", "vendor/assets/images/jquery-ui/ui-bg_flat_0_333333_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_flat_65_ffffff_40x100.png", "vendor/assets/images/jquery-ui/ui-bg_flat_65_ffffff_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_flat_75_ffffff_40x100.png", "vendor/assets/images/jquery-ui/ui-bg_flat_75_ffffff_40x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_glass_55_fbf8ee_1x400.png", "vendor/assets/images/jquery-ui/ui-bg_glass_55_fbf8ee_1x400.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_highlight-hard_100_eeeeee_1x100.png", "vendor/assets/images/jquery-ui/ui-bg_highlight-hard_100_eeeeee_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_highlight-hard_100_f6f6f6_1x100.png", "vendor/assets/images/jquery-ui/ui-bg_highlight-hard_100_f6f6f6_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-bg_highlight-soft_15_cc0000_1x100.png", "vendor/assets/images/jquery-ui/ui-bg_highlight-soft_15_cc0000_1x100.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-icons_004276_256x240.png", "vendor/assets/images/jquery-ui/ui-icons_004276_256x240.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-icons_cc0000_256x240.png", "vendor/assets/images/jquery-ui/ui-icons_cc0000_256x240.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/jquery-ui/ui-icons_ffffff_256x240.png", "vendor/assets/images/jquery-ui/ui-icons_ffffff_256x240.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/bold.png", "vendor/assets/images/markitup/bold.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/code.png", "vendor/assets/images/markitup/code.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h1.png", "vendor/assets/images/markitup/h1.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h2.png", "vendor/assets/images/markitup/h2.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h3.png", "vendor/assets/images/markitup/h3.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h4.png", "vendor/assets/images/markitup/h4.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h5.png", "vendor/assets/images/markitup/h5.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/h6.png", "vendor/assets/images/markitup/h6.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/handle.png", "vendor/assets/images/markitup/handle.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/italic.png", "vendor/assets/images/markitup/italic.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/link.png", "vendor/assets/images/markitup/link.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/list-bullet.png", "vendor/assets/images/markitup/list-bullet.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/list-numeric.png", "vendor/assets/images/markitup/list-numeric.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/paragraph.png", "vendor/assets/images/markitup/paragraph.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/picture.png", "vendor/assets/images/markitup/picture.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/preview.png", "vendor/assets/images/markitup/preview.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/quotes.png", "vendor/assets/images/markitup/quotes.png"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/images/markitup/stroke.png", "vendor/assets/images/markitup/stroke.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/main/spinner.gif", "app/assets/images/main/spinner.gif"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed-comments.png", "app/assets/images/icons/feed-comments.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed.png", "app/assets/images/icons/feed.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon-114x114.png", "public/apple-touch-icon-114x114.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon.png", "public/apple-touch-icon.png"
download_file "#{TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"

# Stylesheets
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.css", "app/assets/stylesheets/application.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/shared.css.scss", "app/assets/stylesheets/shared.css.scss"
download_file "#{BOOTSTRAP_ROOT}/docs/assets/css/bootstrap.css", "vendor/assets/stylesheets/bootstrap.css.scss"
download_file "#{BOOTSTRAP_ROOT}/docs/assets/css/bootstrap-responsive.css", "vendor/assets/stylesheets/bootstrap-responsive.css"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/stylesheets/jquery-ui.css", "vendor/assets/stylesheets/jquery-ui.css"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/stylesheets/jquery.blockUI.css", "vendor/assets/stylesheets/jquery.blockUI.css"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/stylesheets/jquery.markitup.css", "vendor/assets/stylesheets/jquery.markitup.css"

# Stylesheets (CSS to SCSS conversion)
gsub_file "vendor/assets/stylesheets/bootstrap.css.scss", /url\(..\/img\//, 'image-url("bootstrap/'
gsub_file "vendor/assets/stylesheets/bootstrap.css.scss", /\.png\);/, '.png");'
gsub_file "vendor/assets/stylesheets/bootstrap.css.scss", /border-radius\: 0 \\0\/;/, "border-radius: 0;"

# JavaScripts
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/shared.js", "app/assets/javascripts/shared.js"
download_file "http://code.jquery.com/jquery-1.7.1.js", "vendor/assets/javascripts/jquery.js"
download_file "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.js", "vendor/assets/javascripts/jquery-ui.js"
download_file "http://cachedcommons.org/cache/jquery-cookie/0.0.0/javascripts/jquery-cookie.js", "vendor/assets/javascripts/jquery.cookie.js"
download_file "http://cachedcommons.org/cache/jquery-blockui/2.3.3/javascripts/jquery-blockui.js", "vendor/assets/javascripts/jquery.blockUI.js"
download_file "http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js", "vendor/assets/javascripts/jquery.validate.js"
download_file "https://raw.github.com/markitup/1.x/1.1.12/markitup/jquery.markitup.js", "vendor/assets/javascripts/jquery.markitup.js"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/javascripts/jquery.markitup.textile.js", "vendor/assets/javascripts/jquery.markitup.textile.js"
download_file "http://www.datatables.net/download/build/jquery.dataTables.js", "vendor/assets/javascripts/jquery.dataTables.js"
download_file "#{TEMPLATE_ROOT}/rails/vendor/assets/javascripts/jquery.jgrowl.js", "vendor/assets/javascripts/jquery.jgrowl.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-modal.js", "vendor/assets/javascripts/bootstrap-modal.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-dropdown.js", "vendor/assets/javascripts/bootstrap-dropdown.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-scrollspy.js", "vendor/assets/javascripts/bootstrap-scrollspy.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-tab.js", "vendor/assets/javascripts/bootstrap-tab.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-tooltip.js", "vendor/assets/javascripts/bootstrap-tooltip.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-popover.js", "vendor/assets/javascripts/bootstrap-popover.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-alert.js", "vendor/assets/javascripts/bootstrap-alert.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-button.js", "vendor/assets/javascripts/bootstrap-button.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-collapse.js", "vendor/assets/javascripts/bootstrap-collapse.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-carousel.js", "vendor/assets/javascripts/bootstrap-carousel.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-typeahead.js", "vendor/assets/javascripts/bootstrap-typeahead.js"
download_file "#{BOOTSTRAP_ROOT}/js/bootstrap-transition.js", "vendor/assets/javascripts/bootstrap-transition.js"
download_file "http://www.modernizr.com/downloads/modernizr-2.5.3.js", "vendor/assets/javascripts/modernizr.js"
download_file "http://cachedcommons.org/cache/underscore/1.1.0/javascripts/underscore.js", "vendor/assets/javascripts/underscore.js"

# Doc
file "doc/README_FOR_APP", "TODO - Document your application."
download_file "#{TEMPLATE_ROOT}/rails/public/humans.txt", "public/humans.txt"

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
