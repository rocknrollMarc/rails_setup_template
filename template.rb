require "net/http"
require "net/https"
require "uri"

GITHUB_T1_ROOT = "https://raw.github.com/bkuhlmann/rails_setup_template/master"

# Downloads a file, swiching to a secure connection if the source requires it. Also creates parent directories if they do not exist.
# ==== Parameters
# * +source+ - The remote source URL.
# * +destination+ - The local file destination path.
def download_file source, destination
  say "Downloading: #{source} to #{destination}..."
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

# Doc
file "doc/README_FOR_APP", "TODO - Document your application...slacker."
download_file "#{GITHUB_T1_ROOT}/rails/doc/design/site_layout.graffle", "doc/design/site_layout.graffle"

# Controllers
download_file "#{GITHUB_T1_ROOT}/rails/app/controllers/home_controller.rb", "app/controllers/home_controller.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/controllers/about_controller.rb", "app/controllers/about_controller.rb"
route "resource :about, controller: \"about\""
route "resource :home, controller: \"home\""
route "root to: \"home#show\""

# Helpers
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/navigation/menu.rb", "app/helpers/navigation/menu.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/navigation/item.rb", "app/helpers/navigation/item.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/date_time_helper.rb", "app/helpers/date_time_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/flash_helper.rb", "app/helpers/flash_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/image_helper.rb", "app/helpers/image_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/navigation_helper.rb", "app/helpers/navigation_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/system_helper.rb", "app/helpers/system_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/template_helper.rb", "app/helpers/template_helper.rb"
download_file "#{GITHUB_T1_ROOT}/rails/app/helpers/visitor_helper.rb", "app/helpers/visitor_helper.rb"

# Views
remove_file "public/index.html"
download_file "#{GITHUB_T1_ROOT}/rails/app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
download_file "#{GITHUB_T1_ROOT}/rails/app/views/home/show.html.erb", "app/views/home/show.html.erb"
download_file "#{GITHUB_T1_ROOT}/rails/app/views/about/show.html.erb", "app/views/about/show.html.erb"
download_file "#{GITHUB_T1_ROOT}/rails/app/views/shared/menus/_visitor.html.erb", "app/views/shared/menus/_visitor.html.erb"

# Lib
download_file "#{GITHUB_T1_ROOT}/rails/lib/tasks/passenger.rake", "lib/tasks/passenger.rake"
download_file "#{GITHUB_T1_ROOT}/rails/lib/tasks/railroad.rake", "lib/tasks/railroad.rake"
download_file "#{GITHUB_T1_ROOT}/rails/lib/tasks/deadweight.rake", "lib/tasks/deadweight.rake"

# Configurations
download_file "#{GITHUB_T1_ROOT}/rails/config/initializers/active_record.rb", "config/initializers/active_record.rb"
download_file "#{GITHUB_T1_ROOT}/rails/config/initializers/date_time.rb", "config/initializers/date_time.rb"
download_file "#{GITHUB_T1_ROOT}/rails/config/initializers/ruby_enhancements.rb", "config/initializers/ruby_enhancements.rb"
download_file "#{GITHUB_T1_ROOT}/rails/config/initializers/system.rb", "config/initializers/system.rb"
download_file "#{GITHUB_T1_ROOT}/rails/config/initializers/validation.rb", "config/initializers/validation.rb"
development_delta = "config/environments/development.delta.rb"
download_file("#{GITHUB_T1_ROOT}/rails/config/environments/development.rb", development_delta)
insert_into_file "config/environments/development.rb", open(development_delta).read, before: "\nend\n"
remove_file "#{development_delta}"

# Gems
download_file "#{GITHUB_T1_ROOT}/rails/Gemfile", "Gemfile"
generate "resourcer:install"
generate "simple_form:install"
generate "rspec:install"
generate "cucumber:install --rspec"

# Images
remove_file "public/images"
download_file "#{GITHUB_T1_ROOT}/rails/public/favicon.ico", "public/favicon.ico"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/email.gif", "public/themes/default/images/icons/email.gif"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/feed-comments.png", "public/themes/default/images/icons/feed-comments.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/feed.png", "public/themes/default/images/icons/feed.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/icons/unknown.png", "public/themes/default/images/icons/unknown.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/jgrowl/default.png", "public/themes/default/images/jgrowl/default.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/apple-webclip.png", "public/themes/default/images/main/apple-webclip.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/background.jpg", "public/themes/default/images/main/background.jpg"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/main/spinner.gif", "public/themes/default/images/main/spinner.gif"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/bold.png", "public/themes/default/images/markitup/bold.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/code.png", "public/themes/default/images/markitup/code.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h1.png", "public/themes/default/images/markitup/h1.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h2.png", "public/themes/default/images/markitup/h2.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h3.png", "public/themes/default/images/markitup/h3.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h4.png", "public/themes/default/images/markitup/h4.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h5.png", "public/themes/default/images/markitup/h5.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/h6.png", "public/themes/default/images/markitup/h6.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/handle.png", "public/themes/default/images/markitup/handle.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/italic.png", "public/themes/default/images/markitup/italic.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/link.png", "public/themes/default/images/markitup/link.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/list-bullet.png", "public/themes/default/images/markitup/list-bullet.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/list-numeric.png", "public/themes/default/images/markitup/list-numeric.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/paragraph.png", "public/themes/default/images/markitup/paragraph.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/picture.png", "public/themes/default/images/markitup/picture.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/preview.png", "public/themes/default/images/markitup/preview.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/quotes.png", "public/themes/default/images/markitup/quotes.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/markitup/stroke.png", "public/themes/default/images/markitup/stroke.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_diagonals-thick_8_333333_40x40.png", "public/themes/default/images/ui-bg_diagonals-thick_8_333333_40x40.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_flat_65_ffffff_40x100.png", "public/themes/default/images/ui-bg_flat_65_ffffff_40x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_glass_40_111111_1x400.png", "public/themes/default/images/ui-bg_glass_40_111111_1x400.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_glass_55_1c1c1c_1x400.png", "public/themes/default/images/ui-bg_glass_55_1c1c1c_1x400.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-hard_100_f9f9f9_1x100.png", "public/themes/default/images/ui-bg_highlight-hard_100_f9f9f9_1x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-hard_40_aaaaaa_1x100.png", "public/themes/default/images/ui-bg_highlight-hard_40_aaaaaa_1x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_highlight-soft_50_aaaaaa_1x100.png", "public/themes/default/images/ui-bg_highlight-soft_50_aaaaaa_1x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_inset-hard_45_cd0a0a_1x100.png", "public/themes/default/images/ui-bg_inset-hard_45_cd0a0a_1x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-bg_inset-hard_55_ffeb80_1x100.png", "public/themes/default/images/ui-bg_inset-hard_55_ffeb80_1x100.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_222222_256x240.png", "public/themes/default/images/ui-icons_222222_256x240.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_4ca300_256x240.png", "public/themes/default/images/ui-icons_4ca300_256x240.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_bbbbbb_256x240.png", "public/themes/default/images/ui-icons_bbbbbb_256x240.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ededed_256x240.png", "public/themes/default/images/ui-icons_ededed_256x240.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ffcf29_256x240.png", "public/themes/default/images/ui-icons_ffcf29_256x240.png"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/images/ui-icons_ffffff_256x240.png", "public/themes/default/images/ui-icons_ffffff_256x240.png"

# Stylesheets
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/ie.css", "public/themes/default/admin/ie.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/screen.css", "public/themes/default/admin/screen.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/admin/style.css", "public/themes/default/admin/style.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/authorization.css", "public/themes/default/authorization.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/common.css", "public/themes/default/common.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/ie.css", "public/themes/default/ie.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/jquery-ui.css", "public/themes/default/jquery-ui.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/print.css", "public/themes/default/print.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/screen.css", "public/themes/default/screen.css"
download_file "#{GITHUB_T1_ROOT}/rails/public/themes/default/style.css", "public/themes/default/style.css"

# JavaScripts
download_file "http://code.jquery.com/jquery-1.7.1.js", "public/javascripts/jquery.js"
download_file "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js", "public/javascripts/jquery-ui.js"
download_file "http://cachedcommons.org/cache/jquery-cookie/0.0.0/javascripts/jquery-cookie.js", "public/javascripts/jquery.cookie.js"
download_file "http://cachedcommons.org/cache/jquery-blockui/2.3.3/javascripts/jquery-blockui.js", "public/javascripts/jquery.blockUI.js"
download_file "http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js", "public/javascripts/jquery.validate.js"
download_file "#{GITHUB_T1_ROOT}/rails/public/javascripts/jquery.jgrowl.js", "public/javascripts/jquery.jgrowl.js"
download_file "https://raw.github.com/markitup/1.x/1.1.12/markitup/jquery.markitup.js", "public/javascripts/jquery.markitup.js"
download_file "#{GITHUB_T1_ROOT}/rails/public/javascripts/jquery.markitup.textile.js", "public/javascripts/jquery.markitup.textile.js"
download_file "http://cdn.jquerytools.org/1.2.6/all/jquery.tools.min.js", "public/javascripts/jquery.tools.js"
download_file "http://www.datatables.net/download/build/jquery.dataTables.js", "public/javascripts/jquery.dataTables.js"
download_file "http://cachedcommons.org/cache/underscore/1.1.0/javascripts/underscore.js", "public/javascripts/underscore.js"
download_file "http://www.modernizr.com/downloads/modernizr-2.0.6.js", "public/javascripts/modernizr.js"
download_file "#{GITHUB_T1_ROOT}/rails/public/javascripts/application.js", "public/javascripts/application.js"

# Factories
create_file "spec/factories.rb"

# Simple Ruby Version Management (rbenv)
download_file "#{GITHUB_T1_ROOT}/rails/rbenv-version.txt", ".rbenv-version"

# Git
git :init
download_file "#{GITHUB_T1_ROOT}/rails/gitignore.txt", ".gitignore"
run "pre-commit install"
git config: "pre-commit.checks 'console_log, debugger'"
git add: '.'
git commit: "-n -a -m \"Applied Rails Setup Template.\""
