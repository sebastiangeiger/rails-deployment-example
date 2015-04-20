# Cookbook Name:: my_app
# Recipe:: default
#
include_recipe "my_app::ruby"
include_recipe "my_app::git"
include_recipe "postgresql::client"
include_recipe "postgresql::server"

user "deploy" do
  action :create
end

gem_package 'bundler'

deploy "/var/www/rails_sample_app" do
  repo "https://github.com/sebastiangeiger/rails_sample_app.git"
  environment "RAILS_ENV" => "production"
  revision "HEAD"
  action :deploy
  user 'deploy'
  group 'deploy'

  create_dirs_before_symlink  %w{tmp bundle}

  before_migrate do
    execute 'bundle install' do
      cwd release_path
      user 'deploy'
      group 'deploy'
      command "bundle install --deployment --without development --path bundle"
    end
  end
end
