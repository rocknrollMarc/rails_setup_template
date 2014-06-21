# Settings
SETUP_TEMPLATE_NAME = "Rails Setup Template"
SETUP_TEMPLATE_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"
SLIM_TEMPLATE = "https://raw.github.com/bkuhlmann/rails_slim_template/master/template.rb"
JQUERY_COOKIE_ROOT = "https://raw.github.com/carhartl/jquery-cookie/v1.4.0"

# Slim Template
apply SLIM_TEMPLATE

# Bundler
get "#{SETUP_TEMPLATE_ROOT}/rails/Gemfile", "Gemfile"
run "bundle install"
run "spring stop"
generate "foundation:install --slim --skip"
generate "cancan:ability"
generate "resourcer:install"
generate "auther:install"
run "bundle exec guard init bundler"
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
run "bundle exec spring binstub --all"

# Configuration - Initializers
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/active_record.rb", "config/initializers/active_record.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/better_errors.rb", "config/initializers/better_errors.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/date_time.rb", "config/initializers/date_time.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/footnotes.rb", "config/initializers/footnotes.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/mini_profiler.rb", "config/initializers/mini_profiler.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/redis.rb", "config/initializers/redis.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/ruby_enhancements.rb", "config/initializers/ruby_enhancements.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/system.rb", "config/initializers/system.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/initializers/validation.rb", "config/initializers/validation.rb"

# Configuration - Auther
gsub_file "config/initializers/auther.rb", /    paths: \[\"\/admin\"\]/, %(    paths: ["/admin"],)
insert_into_file "config/initializers/auther.rb", %(    authorized_url: "/admin/dashboard"\n), after: %(    paths: ["/admin"],\n)

# Configuration - Capistrano
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/amazon_s3.rb", "config/recipes/amazon_s3.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/base.rb", "config/recipes/base.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/nginx.rb", "config/recipes/nginx.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/nodejs.rb", "config/recipes/nodejs.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/postgresql.rb", "config/recipes/postgresql.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/rbenv.rb", "config/recipes/rbenv.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/redis.rb", "config/recipes/redis.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/unicorn.rb", "config/recipes/unicorn.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/amazon_s3.yml.erb", "config/recipes/templates/amazon_s3.yml.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/nginx.site.erb", "config/recipes/templates/nginx.site.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.sh.erb", "config/recipes/templates/postgresql.sh.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/postgresql.yml.erb", "config/recipes/templates/postgresql.yml.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.rb.erb", "config/recipes/templates/unicorn.rb.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/recipes/templates/unicorn.service.erb", "config/recipes/templates/unicorn.service.erb"
get "#{SETUP_TEMPLATE_ROOT}/rails/config/deploy.rb", "config/deploy.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/Capfile", "Capfile"

# Configuration - Application
application_delta = "config/application.delta.rb"
get("#{SETUP_TEMPLATE_ROOT}/rails/config/application.delta.rb", application_delta)
insert_into_file "config/application.rb", open(application_delta).read, after: %(    config.i18n.default_locale = :en\n)
remove_file application_delta

# Configuration - Production
uncomment_lines "config/environments/production.rb", /config.cache_store/

# Configuration - Stage
run "cp config/environments/production.rb config/environments/stage.rb"

# Configuration - Development
development_delta = "config/environments/development.delta.rb"
get("#{SETUP_TEMPLATE_ROOT}/rails/config/environments/development.delta.rb", development_delta)
insert_into_file "config/environments/development.rb", open(development_delta).read, before: "\nend"
remove_file development_delta
insert_into_file "config/environments/development.rb", "\n  # Enables Guard::LiveReload support without requiring a browser extension.\n  config.middleware.use Rack::LiveReload\n", after: "  # Settings specified here will take precedence over those in config/application.rb.\n"

# Controllers
get "#{SETUP_TEMPLATE_ROOT}/rails/app/controllers/about_controller.rb", "app/controllers/about_controller.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/controllers/admin/base_controller.rb", "app/controllers/admin/base_controller.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/controllers/admin/dashboard_controller.rb", "app/controllers/admin/dashboard_controller.rb"

# Routes
route %(end)
route %(  resource "dashboard", controller: "dashboard", only: "show")
route %(namespace :admin do)
route %(resource :about, controller: "about")

# Helpers
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation/menu.rb", "app/helpers/navigation/menu.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation/item.rb", "app/helpers/navigation/item.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/date_time_helper.rb", "app/helpers/date_time_helper.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/image_helper.rb", "app/helpers/image_helper.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/navigation_helper.rb", "app/helpers/navigation_helper.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/system_helper.rb", "app/helpers/system_helper.rb"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/helpers/visitor_helper.rb", "app/helpers/visitor_helper.rb"

# Views
get "#{SETUP_TEMPLATE_ROOT}/rails/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/views/layouts/admin.html.slim", "app/views/layouts/admin.html.slim"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/views/home/show.html.slim", "app/views/home/show.html.slim"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/views/about/show.html.slim", "app/views/about/show.html.slim"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/views/admin/dashboard/show.html.slim", "app/views/admin/dashboard/show.html.slim"

# Images
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/images/icons/feed-comments.png", "app/assets/images/icons/feed-comments.png"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/images/icons/feed.png", "app/assets/images/icons/feed.png"

# Stylesheets
remove_file "app/assets/stylesheets/application.css"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/stylesheets/application.css.scss", "app/assets/stylesheets/application.css.scss"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/stylesheets/shared.css.scss", "app/assets/stylesheets/shared.css.scss"

# JavaScripts
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/javascripts/application.js", "app/assets/javascripts/application.js"
get "#{SETUP_TEMPLATE_ROOT}/rails/app/assets/javascripts/shared.js", "app/assets/javascripts/shared.js"
get "#{JQUERY_COOKIE_ROOT}/jquery.cookie.js", "vendor/assets/javascripts/jquery.cookie.js"

# Git
git :init
git add: '.', commit: "-n -a -m \"Added the #{SETUP_TEMPLATE_NAME}.\""

# End
say_status :end, "#{SETUP_TEMPLATE_NAME} Complete!"
