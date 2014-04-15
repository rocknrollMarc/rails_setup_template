# Settings
SETUP_TEMPLATE_NAME = "Rails Setup Template"
SETUP_TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"
SLIM_TEMPLATE = "https://raw.github.com/bkuhlmann/rails_slim_template/master/template.rb"
JQUERY_COOKIE_ROOT = "https://raw.github.com/carhartl/jquery-cookie/v1.3.1"

# Slim Template
apply SLIM_TEMPLATE

# Configurations
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/active_record.rb", "config/initializers/active_record.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/better_errors.rb", "config/initializers/better_errors.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/date_time.rb", "config/initializers/date_time.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/footnotes.rb", "config/initializers/footnotes.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/mini_profiler.rb", "config/initializers/mini_profiler.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/redis.rb", "config/initializers/redis.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/ruby_enhancements.rb", "config/initializers/ruby_enhancements.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/system.rb", "config/initializers/system.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/validation.rb", "config/initializers/validation.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/amazon_s3.rb", "config/recipes/amazon_s3.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/base.rb", "config/recipes/base.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/nginx.rb", "config/recipes/nginx.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/nodejs.rb", "config/recipes/nodejs.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/postgresql.rb", "config/recipes/postgresql.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/rbenv.rb", "config/recipes/rbenv.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/redis.rb", "config/recipes/redis.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/unicorn.rb", "config/recipes/unicorn.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/amazon_s3.yml.erb", "config/recipes/templates/amazon_s3.yml.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/nginx.site.erb", "config/recipes/templates/nginx.site.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.sh.erb", "config/recipes/templates/postgresql.sh.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.yml.erb", "config/recipes/templates/postgresql.yml.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.rb.erb", "config/recipes/templates/unicorn.rb.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.service.erb", "config/recipes/templates/unicorn.service.erb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/config/deploy.rb", "config/deploy.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/Capfile", "Capfile"

application_delta = "config/application.delta.rb"
download_file("#{SETUP_TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: "    config.i18n.default_locale = \"en-US\"\n"
remove_file application_delta

uncomment_lines "config/environments/production.rb", /config.cache_store/
run "cp config/environments/production.rb config/environments/stage.rb"

development_delta = "config/environments/development.delta.rb"
download_file("#{SETUP_TEMPLATE_ROOT}/rails/config/environments/development.delta.rb", development_delta)
insert_into_file "config/environments/development.rb", open(development_delta).read, before: "\nend"
remove_file development_delta
insert_into_file "config/environments/development.rb", "\n  # Enables Guard::LiveReload support without requiring a browser extension.\n  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload\n", after: "  # Settings specified here will take precedence over those in config/application.rb.\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.smtp_settings = { :address => \"localhost\", :port => 1025 }\n", after: "  config.action_mailer.raise_delivery_errors = false\n"
insert_into_file "config/environments/development.rb", "  config.action_mailer.delivery_method = :smtp\n", after: "  config.action_mailer.raise_delivery_errors = false\n"

# Bundler
download_file "#{SETUP_TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
run "bundle binstubs rspec-core"
run "bundle binstubs guard"

# Controllers
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/controllers/about_controller.rb", "app/controllers/about_controller.rb"

# Routes
route "resource :about, controller: \"about\""

# Helpers
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation/menu.rb", "app/helpers/navigation/menu.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation/item.rb", "app/helpers/navigation/item.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/date_time_helper.rb", "app/helpers/date_time_helper.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/image_helper.rb", "app/helpers/image_helper.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation_helper.rb", "app/helpers/navigation_helper.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/system_helper.rb", "app/helpers/system_helper.rb"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/visitor_helper.rb", "app/helpers/visitor_helper.rb"

# Views
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/views/home/show.html.slim", "app/views/home/show.html.slim"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/views/about/show.html.slim", "app/views/about/show.html.slim"

# Images
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/images/icons/feed-comments.png", "app/assets/images/icons/feed-comments.png"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/images/icons/feed.png", "app/assets/images/icons/feed.png"

# Stylesheets
remove_file "app/assets/stylesheets/application.css"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.css.scss", "app/assets/stylesheets/application.css.scss"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/stylesheets/shared.css.scss", "app/assets/stylesheets/shared.css.scss"

# JavaScripts
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"
download_file "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/javascripts/shared.js", "app/assets/javascripts/shared.js"
download_file "#{JQUERY_COOKIE_ROOT}/jquery.cookie.js", "vendor/assets/javascripts/jquery.cookie.js"

# Gems
generate "foundation:install --slim --skip"
generate "cancan:ability"
generate "resourcer:install"
generate "simple_form:install"
run "bin/guard init rspec"
run "bin/guard init livereload"

# Git
git :init
git add: '.', commit: "-n -a -m \"Added the #{SETUP_TEMPLATE_NAME}.\""

# End
say_status :end, "#{SETUP_TEMPLATE_NAME} Complete!"
