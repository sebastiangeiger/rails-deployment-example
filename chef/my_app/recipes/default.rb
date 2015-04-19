# Cookbook Name:: my_app
# Recipe:: default
#
include_recipe "my_app::ruby"
include_recipe "my_app::git"
include_recipe "postgresql::client"
include_recipe "postgresql::server"

deploy "/var/www/rails_sample_app" do
  repo "https://github.com/sebastiangeiger/rails_sample_app.git"
  environment "RAILS_ENV" => "production"
  revision "HEAD"
  action :deploy
  create_dirs_before_symlink  %w{tmp public config deploy}

  symlink_before_migrate  "config/database.yml" => "config/database.yml"
end
