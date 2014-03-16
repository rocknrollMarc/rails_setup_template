require "net/http"
require "net/https"
require "uri"

TEMPLATE_NAME = "Rails Setup Template"
TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"
JQUERY_COOKIE_ROOT = "https://raw.github.com/carhartl/jquery-cookie/v1.3.1"
UNDERSCORE_ROOT = "https://raw.github.com/documentcloud/underscore/1.6.0"

# Downloads a file, swiching to a secure connection if the source requires it. Also creates parent directories if they do not exist.
# ==== Parameters
# * +source+ - The remote source URL.
# * +destination+ - The local file destination path.
def download_file source, destination
  say_status :download, "#{source} to #{destination}."
  uri = URI.parse source
  http = Net::HTTP.new uri.host, uri.port
  http.use_ssl = uri.scheme == "https"
  request = Net::HTTP::Get.new uri.request_uri
  response = http.request request
  project_file = File.join destination_root, destination
  project_directory = File.dirname project_file
  FileUtils.mkdir_p(project_directory) unless File.exist?(project_directory)
  File.open(project_file, "w") {|file| file.write response.body}
end

# Ruby Version Management
download_file "#{TEMPLATE_ROOT}/rails/ruby-version.txt", ".ruby-version"

# Configurations
download_file "#{TEMPLATE_ROOT}/rails/env.txt", "config/.env"
download_file "#{TEMPLATE_ROOT}/rails/Capfile", "Capfile"
download_file "#{TEMPLATE_ROOT}/rails/config/deploy.rb", "config/deploy.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/amazon_s3.rb", "config/recipes/amazon_s3.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/base.rb", "config/recipes/base.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/nginx.rb", "config/recipes/nginx.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/nodejs.rb", "config/recipes/nodejs.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/postgresql.rb", "config/recipes/postgresql.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/rbenv.rb", "config/recipes/rbenv.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/redis.rb", "config/recipes/redis.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/unicorn.rb", "config/recipes/unicorn.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/amazon_s3.yml.erb", "config/recipes/templates/amazon_s3.yml.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/nginx.site.erb", "config/recipes/templates/nginx.site.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.sh.erb", "config/recipes/templates/postgresql.sh.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.yml.erb", "config/recipes/templates/postgresql.yml.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.rb.erb", "config/recipes/templates/unicorn.rb.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.service.erb", "config/recipes/templates/unicorn.service.erb"
download_file "#{TEMPLATE_ROOT}/rails/config/database.yml", "config/database.yml"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/active_record.rb", "config/initializers/active_record.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/better_errors.rb", "config/initializers/better_errors.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/date_time.rb", "config/initializers/date_time.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/footnotes.rb", "config/initializers/footnotes.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/mini_profiler.rb", "config/initializers/mini_profiler.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/redis.rb", "config/initializers/redis.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/ruby_enhancements.rb", "config/initializers/ruby_enhancements.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/system.rb", "config/initializers/system.rb"
download_file "#{TEMPLATE_ROOT}/rails/config/initializers/validation.rb", "config/initializers/validation.rb"

application_delta = "config/application.delta.rb"
download_file("#{TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: "  # config.i18n.default_locale = :de\n"
remove_file application_delta
gsub_file "config/application.rb", /# config.time_zone = \'Central Time \(US & Canada\)\'/, "config.time_zone = \"UTC\""
gsub_file "config/application.rb", /# config.i18n.default_locale = :de/, "config.i18n.default_locale = \"en-US\""

uncomment_lines "config/environments/production.rb", /config.cache_store/
run "cp config/environments/production.rb config/environments/stage.rb"

development_delta = "config/environments/development.delta.rb"
download_file("#{TEMPLATE_ROOT}/rails/config/environments/development.delta.rb", development_delta)
insert_into_file "config/environments/development.rb", open(development_delta).read, before: "\nend"
remove_file development_delta
insert_into_file "config/environments/development.rb", "\n  # Enables Guard::LiveReload support without requiring a browser extension.\n  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload\n", after: "  # Settings specified here will take precedence over those in config/application.rb.\n"
gsub_file "config/environments/development.rb", /# Don't care if the mailer can't send./, "# Configured for use by the MailCatcher gem."
insert_into_file "config/environments/development.rb", "  config.action_mailer.smtp_settings = { :address => \"localhost\", :port => 1025 }\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.delivery_method = :smtp\n", after: "  config.action_mailer.raise_delivery_errors = false\n"

# Gems
download_file "#{TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
generate "foundation:install --slim"
generate "cancan:ability"
generate "resourcer:install"
generate "simple_form:install"
generate "rspec:install"
download_file "#{TEMPLATE_ROOT}/rails/rspec.txt", ".rspec"
create_file "spec/factories.rb"
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
run "bundle exec spring binstub --all"

# Controllers
insert_into_file "app/controllers/application_controller.rb", "  helper :all\n", after: "class ApplicationController < ActionController::Base\n"
download_file "#{TEMPLATE_ROOT}/rails/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/controllers/about_controller.rb", "app/controllers/about_controller.rb"

# Routes
route "resource :about, controller: \"about\""
route "resource :home, controller: \"home\""
route "root \"home#show\""

# Helpers
remove_file "app/helpers/application_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation/menu.rb", "app/helpers/navigation/menu.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation/item.rb", "app/helpers/navigation/item.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/date_time_helper.rb", "app/helpers/date_time_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/image_helper.rb", "app/helpers/image_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/navigation_helper.rb", "app/helpers/navigation_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/system_helper.rb", "app/helpers/system_helper.rb"
download_file "#{TEMPLATE_ROOT}/rails/app/helpers/visitor_helper.rb", "app/helpers/visitor_helper.rb"

# Views
download_file "#{TEMPLATE_ROOT}/rails/app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/shared/_flash_messages.html.erb", "app/views/shared/_flash_messages.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/shared/_error_messages.html.erb", "app/views/shared/_error_messages.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/home/show.html.erb", "app/views/home/show.html.erb"
download_file "#{TEMPLATE_ROOT}/rails/app/views/about/show.html.erb", "app/views/about/show.html.erb"

# Images
remove_file "app/assets/images/rails.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed-comments.png", "app/assets/images/icons/feed-comments.png"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/images/icons/feed.png", "app/assets/images/icons/feed.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon-114x114.png", "public/apple-touch-icon-114x114.png"
download_file "#{TEMPLATE_ROOT}/rails/public/apple-touch-icon.png", "public/apple-touch-icon.png"
download_file "#{TEMPLATE_ROOT}/rails/public/favicon.ico", "public/favicon.ico"

# Stylesheets
remove_file "app/assets/stylesheets/application.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.css", "app/assets/stylesheets/application.css"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/bootstrap-patch.css.scss", "app/assets/stylesheets/bootstrap-patch.css.scss"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/stylesheets/shared.css.scss", "app/assets/stylesheets/shared.css.scss"

# JavaScripts
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"
download_file "#{TEMPLATE_ROOT}/rails/app/assets/javascripts/shared.js", "app/assets/javascripts/shared.js"
download_file "#{JQUERY_COOKIE_ROOT}/jquery.cookie.js", "vendor/assets/javascripts/jquery.cookie.js"
download_file "#{UNDERSCORE_ROOT}/underscore.js", "vendor/assets/javascripts/underscore.js"

# Doc
download_file "#{TEMPLATE_ROOT}/rails/public/humans.txt", "public/humans.txt"

# Specs
download_file "#{TEMPLATE_ROOT}/rails/spec/spec_helper.rb", "spec/spec_helper.rb"

# Git
git :init
download_file "#{TEMPLATE_ROOT}/rails/gitignore.txt", ".gitignore"
git add: '.', commit: "-n -a -m \"Added the #{TEMPLATE_NAME}.\""

# End
say_status :end, "#{TEMPLATE_NAME} Complete!"
