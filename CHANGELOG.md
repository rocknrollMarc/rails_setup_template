# v6.0.0

* Fixed the Better Errors initializer to only enable Pry in development environment only.
* Fixed gem requirements to use hashrockets syntax since it causes errors to be thrown during install.
* Upgraded to Ruby 2.0.0-p247.
* Upgraded to Rails 4.0.0.
* Upgraded to jQuery 2.0.3.
* Upgraded ActiveRecord initializer to use partial_writes since partial_updates is deprecated in Rails 4.
* Removed the jQuery Validation library.
* Removed the Data Tables library.
* Removed the README.rdoc and doc/README_FOR_APP template stubs since the Rails 4.0.0 defaults are better.
* Removed deletion of the public/index.html since it is no longer provided in Rails 4.0.0.
* Removed the :assets group from the Gemfile.
* Removed the Sextant gem since it part of Rails 4.0.0 now.
* Removed 'to' from root route.
* Removed the Pry Debugger gem.
* Removed the installation of bundler binstubs.
* Removed seconds from default datetime format.
* Added a Versioning section to the README.
* Added the doc asset group.
* Added media: 'all' to application.html.erb layout.
* Added the Naught gem.
* Added the Navigator gem.
* Added the Gravitarify gem.
* Added the Uglifier gem.
* Added the SASS Rails gem.
* Added the Bourbon gem.
* Added the Secure Headers gem.
* Added the Breach Mitigation Rails gem.
* Added the Pry ByeBug gem.
* Added the Pry Doc gem.
* Added the Bullet gem.
* Added the Rack::MiniProfiler gem.
* Added the Rails Footnotes gem.
* Added the VCR gem.
* Added the SimpleCov gem.
* Broke Gemfile into sections for readability.
* Converted from RDoc to Markdown documentation.

# v5.2.0

* Upgraded to Ruby 2.0.0-p195.
* Upgraded to jQuery 2.0.0.
* Upgraded to jQuery UI 1.10.3.
* Renamed .rbenv-version to .ruby-version to be compatible with multiple Ruby version managers.
* Added the Xray Rails gem requirement.
* Added the Rack::Attack gem requirement.
* Switched from pry-nav to the pry-debugger gem.
* Added the better_errors.rb initializer which enables Pry by default when inspecting exceptions.
* Added pry-rescue support.
* Added Bond gem support.
* Converted tabs to spaces. Removed excess whitespace.
* Enable SASS debugging in development mode.

# v5.1.0

* Removed the Code Climate badge.
* Removed manual setup of Twitter Bootstrap assets. Everything is provided via the bootstrap-sass gem now.
* Removed the andand gem.
* Added the MetaRequest gem requirement.
* Added the Rack LiveReload gem requirement.
* Added the Guard::LiveReload gem requirement.
* Added the Lauchy gem requirement.
* Added the bootstrap-sass gem requirement.
* Added the Fast Blank gem requirement.
* Added the Chrome Logger gem requirement.
* Added Guard initialization for LiveReload support.
* Added Guard::LiveReload middleware support to development environment.
* Switched to using the public_send instead of the send method where appropriate.
* Force Bundler to generate binstubs.

# v5.0.0

* Upgraded to Ruby 2.0.0-p0.
* Upgraded to Rails 3.2.13.
* Upgraded to jQuery 1.9.1.
* Upgraded to jQuery UI 1.10.2.
* Upgraded to jQuery Cookie 1.3.1.
* Upgraded to jQuery Validation 1.11.1.
* Upgraded to jQuery DataTables 1.9.4.
* Upgraded to Twitter Bootstrap 2.3.1.
* Upgraded to Underscore 1.4.4.
* Removed the New Relic Gem.
* Removed the jQuery Growl JavaScript library.
* Removed the template_helper.rb file.
* Added CanCan initializer to template setup.
* Added default page header styling.
* Removed Block UI JavaScript library and related resources.
* Removed jQuery BlockUI spinner and styling.
* Removed developer label and URL info.
* Fixed README text in regards to the .railsrc file.
* Fixed HTML meta description text to use system description instead of missing translation.
* Added the Twitter Bootstrap patch stylesheet.
* Updated and labeled the Guard gems for file system notifications on OSX and Linux.
* Removed the .center CSS class - Provided by Twitter Bootstrap now.
* Condensed the git add and commit lines to one line in template.rb.
* Added Railscast 148 to README.
* Added the database cleaner gem to the test group.
* Added 'Why we don't use a Rails template' to the README. Thanks Eric.
* Applied Code Climate GPA badge.
* Switched from HTTP to HTTPS when sourcing from RubyGems.
* Cleaned up Guard gem dependency requirements.

# v4.6.0

* Upgraded to Ruby 1.9.3-p374.
* Upgraded to Rails 3.2.11.
* Upgraded to jQuery 1.9.0.
* Upgraded to jQuery UI 1.10.0.
* Upgraded to Underscore 1.4.3.
* Upgraded to Modernizr 2.6.2.
* Upgraded to Twitter Bootstrap 2.2.2.
* Added the MailCatcher gem requirement.
* Added the License Finder gem.
* Added the Better Errors gem.
* Added the Browser Details gem.
* Added the fakeweb gem.
* Added the guard gems in to the development group.
* Added Code Climate support.
* Added default Rspec coloring and formating to the rspec.txt template.
* Added generator default overrides to application.rb.
* Switched Twitter Bootstrap meta attribute tag order.
* Converted/detailed the CONTRIBUTING guidelines per GitHub requirements.
* Removed the turn gem.
* Removed the rack-webconsole gem.
* Removed Phusion Passenger support.

# v4.5.0

* Fixed error message with Guard initialization.
* Upgraded to Ruby 1.9.3-p194.
* Upgraded to Rails 3.2.6.
* Upgraded to jQuery UI 1.8.21.
* Upgraded to Twitter Bootstrap 2.0.4.
* Upgraded to Underscore 1.3.3.
* Added Redis initialization support
* Added the redis-namespace gem.
* Added the pry, pry-vterm_aliases, pry-stack_explorer, pry-remote, and pry-nav gem requirements.
* Added the Capybara gem requirement.
* Added the bcrypt-ruby gem requirement.
* Added the cancan gem requirement.
* Added the Prawn+ gem requirement.
* Added the sextant gem requirement.
* Added Sorter assets to application JS and CSS files.
* Created a common set of gems for both development and test in the Gemfile.
* Replaced AASM with the state_machine gem.
* Renamed application.css to application.css.scss.
* Removed the ruby-debug19 gem requirement.
* Switched gem requirement from Wirble to Wirb.

# v4.4.0

* Fixed bad CSS class name for field-error.
* Fixed bug with bogus end quote for DOCTYPE html statement.
* Fixed flash messages partial and added alert message close support via Twitter Bootstrap.
* Upgraded to jQuery 1.7.2.
* Upgraded to Rails 3.2.3.
* Removed the enabling of config.active_record.whitelist_attributes since this is default in Rails 3.2.3 now.
* Removed FlashMessage helper and replaced with a shared/_flash_messages partial.
* Added template for form error messages.
* Added autotomatic DB migrations to cap deployments.
* Added "helper :all" to application_controller.rb.
* Switched to fix layout for Twitter Bootstrap.
* Removed the page ID from the application.html.erb file.
* Updated simple form generator to specify the bootstrap option.
* Added meta tag for device width to application.html.erb.
* Moved loading of JavaScript files to end of application.html.erb body tag.
* Added more style guides to the README.
* Removed RailRoad gem support and switched to the Railroady gem instead.
* Replaced the aws-s3 gem with the aws-sdk gem.
* Removed the ruby-growl gem.
* Removed the cucumber-rails gem.
* Added the bootstrap-will_paginate gem.
* Added the rb-fsevent and guard-rspec gems.
* Added guard initialization to template.
* Added the quiet_assets gem.
* Added the log_plus gem.
* Added Capistrano recipes for amazon_s3, nginx, node.js, postgresql, rbenv, redis, and unicorn.
* Added smart user and database detection for PostgreSQL and multi-environment support for nginx and unicorn.
* Switched config/database.yml to config/*.yml in the gitignore file.

# v4.3.0

* Fixed load order for Twitter Bootstrap JS files.
* Fixed the jQuery UI CSS file name.
* Upgraded to Rails 3.2.2.
* Upgraded to Twitter Bootstrap 2.0.2.
* Upgraded to jQuery 1.8.18.
* Removed MarkItUp support.
* Removed Deadweight gem support.
* Removed Pre-Commit gem support.
* Relaxed/reduced the CSS shared defaults.
* Updated the title helper so that system name is a suffix and not a prefix.
* Switched the breadcrumbs helper to use a class instead of an ID for better compatibility with Twitter Bootstrap.
* Added Capistrano support.
* Added config/database.yml to .gitignore.
* Added a stage environment (defaults to a mirror of the production environment).
* Added auto-adjustments to the application.rb file for time_zone, default_locale, and whitelist_attributes.
* Added responsive top bar navigation collapsing.
* Cleaned up the options for new rails apps in the README.

# v4.2.0

* Fixed image-url path references in the bootstrap, jquery-ui, and marktitup stylesheets.
* Upgraded to Ruby 1.9.3-p125.
* Upgraded to Twitter Bootstrap 2.0.1.
* Upgraded to Underscore 1.3.1.
* Upgraded to Modernizr 2.5.3.
* Added CSS to SCSS conversion for bootstrap.css.scss file.
* Added missing Twitter Bootstrap glyph icons.
* Switched to :rubygems symbol for the Gemfile definition.
* Added the timecop gem.
* Removed references to jQuery Block UI growl styles and images.

# v4.1.0

* Fixed README typos and invalid links.
* Fixed load order of Twitter Bootstrap JavaScript files.
* Upgraded to Ruby 1.9.3-p0.
* Upgraded to Rails 3.2.1.
* Removed the paperclip and silent-postgres gems.
* Removed the Colorblind gem.

# v4.0.0

* Fixed deprecation warnings with navigation menu and items classes.
* Applied Ruby 1.9 syntax upgrades.
* Removed the current_route method from the navigation helper.
* Updated the date/time initializer with new patterns.
* Updated the README with additional post-install configurations.
* Added the New Relic gem.
* Upgraded to Rails 3.1.3.
* Upgraded to jQuery 1.7.1.
* Upgraded to jQuery UI 1.8.17.
* Upgraded to Modernizr 2.0.6.
* Added a Best Practices section to the README which includes the Rails Style Guide.
* Added the simple_form and andand gems.
* Removed the formtastic gem.
* Added the rack-webconsole gem.
* Dropped RVM support and switched to rbenv.
* Moved all gem requirements from the template.rb to the Gemfile template (better formatting, easier to read).
* Cleaned the download messages so that they behave and look like other Thor messages.
* Moved all public folders for images, stylesheets, and javascript to the app/assets and vendor/assets folders respectively.
* Removed the email and unknown icons.
* Removed the background image.
* Removed the jQuery TOOLS JavaScript library.
* Added bundle install to template execution.
* Added BOOTSTRAP_ROOT for Twitter Bootstrap CSS and JavaScript files to template.
* Renamed GITHUB_T1_ROOT to TEMPLATE_ROOT.
* Updated all javascript and stylesheet links within the application.html.erb layout.
* Added the Apple iOS icons for dimensions 57x57 and 114x114 pixels.
* Cleaned up the application.html.erb encoding and identity code.
* Removed the THEME_NAME and THEME_ROOT constants.
* Removed the site design docs - See Twitter Bootstrap docs instead.
* Applied Twitter Bootstrap theme to project - layouts and views are in sync.
* Updated the system initializer with new system label and description.
* Added humans.txt to the public folder.
* Renamed Best Practices to Resources in README.
* Added "Extending Rails" doc to Resources section of the README.

# v3.0.0

* Updated the .gitignore file to exclude more RSpec and YARD files.
* Upgraded to jQuery 1.7.0.
* Upgraded to jQuery UI 1.8.16.
* Upgraded to jQuery Mark It Up 1.1.12.
* Upgraded to jQuery DataTables 1.7.5.
* Upgraded to jQuery jGrowl 1.2.5.
* Upgraded to Modernizr 1.7.0.
* Upgraded to Blueprint CSS 1.0.
* Added the Linguist gem requirement.
* Added the Active Sanity gem.
* Added the CoffeeScript gem.
* Added the Squeel gem.
* Added the Ransack gem.
* Added the Factory Girl Rails gem.
* Added the Sessioner gem.
* Added the Tokener gem.
* Added the Paperclip Plus gem.
* Added a .rvmrc file.
* Added Git commit checks (via the Pre-Commit gem).
* Replaced the Cucumber gem with the Cucumber-Rails gem.
* Replaced the LESS gem with the SASS gem.
* Replaced the Acts as List gem with the Sorter gem.
* Removed the position_helper since it is part of the Sorter gem now.
* Removed the lib/utils/acts_as_list_enhancements.rb module enhancements as these are now part of the Sorted List gem.
* Removed any images related to jQuery TOOLS library. Updated the CSS to behave like the original images.
* Removed the Looksee gem.
* Removed the Bullet gem.

# v2.0.0

* Upgraded template to support Rails 3.0.0.
* Upgraded to jQuery 1.4.3.
* Upgraded to jQuery UI 1.8.5.
* Upgraded to jQuery Block UI 2.33.
* Upgraded to jQuery Validation 1.7.
* Upgraded to jQuery Tools 1.2.5.
* Upgraded to Modernizr 1.6.0.
* Upgraded to Underscore 1.1.0.
* Added the jQuery DataTables 1.7.4 JavaScript library.
* Added the jQuery Cookie JavaScript library.
* Added the Rails ERD gem requirement.
* Removed the heroku.rake file. See the Heroku Plus gem for additional capabilities.
* Replaced the Awesome Nested Set with the Lineage gem.
* Removed the More plugin.
* Removed all plugin installs.

# v1.2.0

* Fixed an issue where the opening HTML tag was missing from the application.html.erb layout.
* Fixed issue with template inheritance (i.e. when other templates inherit this template).
* Fixed issue with unnecessary loading of the Rails environment in the database.rake file.
* Moved the bullet, deadweight, and railroad gem definitions to the development.rb environment.
* Moved the rspec, rspec-rails, cucumber, webrat, metric_fu gems definitions to the test.rb environment.
* Added enhancements to the default Acts as List behavior (see lib/acts_as_list_enhancements.rb).
* Added the jQuery Mark It Up 1.1.8 JavaScript library.
* Added the jQuery Tools 1.2.4 JavaScript library.
* Added the Modernizr JavaScript library.
* Added improved menu navigation.

# v1.1.0

* Added the LESS gem requirement.
* Added the More plugin.
* Added the Rails Indexes plugin.
* Added the Formtastic gem requirement.
* Added the Bullet gem requirement.
* Added the Deadweight gem requirement.
* Removed the AndAnd gem requirement.
* Added Git setup and initialization.
* Removed the visitor namespace.
* Added the Underscore JavaScript library.
* Upgraded to jQuery 1.4.2.
* Upgraded to jQuery UI 1.8.2.
* Updated the db:reseed rake task so that it also rebuilds the models diagrams.
* Added a rake task for printing database and database table sizes.
* Added a rake task for Heroku deployments.
* Added a rake task for Deadweight.
* Upgraded to Blueprint 0.9.1.
* Added Phusion Passenger debug support (see passenger.rake).
* Updated all gem definitions due to rubygems.org changes.

# v1.0.0

* Initial version.
