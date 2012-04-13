set_default(:amazon_s3_access_key_id) {Capistrano::CLI.password_prompt "Enter Amazon S3 Access Key: "}
set_default(:amazon_s3_secret_access_key) {Capistrano::CLI.password_prompt "Enter Amazon S3 Secret Access Key: "}

namespace :amazon_s3 do
  desc "Generates the amazon_s3.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "amazon_s3.yml.erb", "#{shared_path}/config/amazon_s3.yml"
  end
  after "deploy:setup", "amazon_s3:setup"

  desc "Symlinks the amazon_s3.yml file for latest release."
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/amazon_s3.yml #{release_path}/config/amazon_s3.yml"
  end
  after "deploy:finalize_update", "amazon_s3:symlink"
end
