# v8.1.0

* Refactored the "download_file" method to use the native Thor "get" method instead.
* Updated Gemfile to re-enable the xray-rails gem since it works for Rails 4.1.x now.
* Updated the Gemfile to use typhoeus instead of the webmock gem.
* Added the [Priscilla](https://github.com/Arkham/priscilla) gem.

# v8.0.0

* Fixed verb used for initial git commit of template.
* Fixed spec helper syntax.
* Fixed bug where Modernizr.js was not added to the assets precompile path.
* Fixed loading of mini profiler to development environment only.
* Fixed template errors related to application.rb and stage.rb files.
* Removed the pry-vterm_aliases gem.
* Removed jQuery UI support.
* Removed Bootstrap support from Simple Form setup.
* Removed the bootstrap-will_paginate gem.
* Removed the sdoc gem.
* Removed the squeel gem as it is not supported in Rails 4.x.x.
* Removed Underscore.js.
* Removed the Bourbon gem.
* Removed RSpec files (provided by the Rails Slim Template instead).
* Removed the home_controller.rb since it is provided by the Rails Slim Template.
* Removed the Simple Form gem since it no longer supports latests versions of Bootstrap and Foundation.
* Removed the RedCloth gem.
* Removed the breach-mitigation-rails gem.
* Updated to MRI 2.1.1.
* Updated to Rails 4.1.0.
* Updated to jQuery Cookie 1.4.0.
* Updated bcrypt-ruby to bcrypt.
* Updated the Slim gem to [Slim Rails](https://github.com/slim-template/slim-rails).
* Updated Foundation Rails install to default to Slim templates.
* Updated RSpec helper to disable GC for all specs in order to improve performance.
* Updated the Gemfile to list sprockets_better_errors and xray-rails as disabled due to lack of Rails 4.1.x support.
* Updated .gitignore to exclude secrets.yml.
* Refactored all views to Foundation styles and Slim templates.
* Added the [Rails Slim Template](https://github.com/bkuhlmann/rails_slim_template).
* Added the [jQuery Rails](https://github.com/rails/jquery-rails) gem.
* Added the [Modernizr](https://github.com/russfrisch/modernizr-rails) gem.
* Added the [Spring](https://github.com/rails/spring) gem.
* Added the [Spring Commands RSpec](https://github.com/jonleighton/spring-commands-rspec) gem.
* Added the [Dotenv Rails](https://github.com/bkeepers/dotenv) gem and removed the Figaro gem.
* Added the [Foundation Rails](http://foundation.zurb.com) gem and removed the Bootstrap Rails gem.
* Added the [Bower Rails](https://github.com/42dev/bower-rails) gem.
* Added the [JBuilder](https://github.com/rails/jbuilder) gem.
* Added the [Rails 12 Factor](https://github.com/heroku/rails_12factor) gem.
* Added gem versions to Gemfile.

# v7.0.0

* Fixed Tracer Bullet Gemfile requirement.
* Fixed the loading of Bootstrap SASS and JavaScript files.
* Fixed RSpec deprecation warnings for treating metadata symbol keys as true values.
* Fixed asset pipeline errors regarding loading of Bootstrap and jQuery UI assets.
* Removed the Chrome Logger gem.
* Removed the FakeWeb gem.
* Removed the MailCatcher gem since it can cause conflicts with other gems.
* Removed the appliation_helper.rb from the install.
* Updated to Ruby 2.1.0.
* Updated to Rails 4.0.2.
* Updated to Underscore.js 1.5.2.
* Updated to Modernizr 2.7.1.
* Updated the humans.txt file.
* Updated template to uncomment default cache store for production and stage environments.
* Updated the Rails application to use concurrent threads.
* Updated the development environment to use long-polling for web console.
* Updated development.rb to use xterm colors for web console.
* Updated Web Console settings for development environment.
* Added a Rack::MiniProfiler initializer.
* Added the [Pry Git](https://github.com/pry/pry-git) gem.
* Added the [Pry Doc](https://github.com/pry/pry-doc) gem.
* Added the [Figaro](https://github.com/laserlemon/figaro) gem.
* Added the application.yml (for use with Figaro).
* Added the [Tracer Bullets](https://github.com/n8/tracer_bullets) gem.
* Added the [Dalli](https://github.com/mperham/dalli) gem.
* Added the [Puma](http://puma.io) gem.
* Added the [Web Console](https://github.com/rails/web-console) gem.
* Added the [Webmock](https://github.com/bblimke/webmock) gem.
* Added the [Capybara Extensions](https://github.com/dockyard/capybara-extensions) gem.
* Added the [Slim](https://github.com/slim-template/slim) gem.
* Added the [Rails DB Info](https://github.com/vlado/rails_db_info) gem.
* Added the [Deep Tree](https://github.com/PatrickTulskie/deep_tree) gem.
* Added the [Sprockets Better Errors](https://github.com/schneems/sprockets_better_errors) gem.
* Added conditional SSL support for all application environments.
* Added HTTPS support for template file download.
* Added default RSpec spec helper settings.
* Added HTML, CSS, and JavaScript compression.
* Added mem cache store for all environments by default.
* Added a Ruby BigDecimal inspection enhancement.

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
