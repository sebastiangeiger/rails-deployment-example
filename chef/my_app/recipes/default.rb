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

deploy "/var/www/rails_sample_app" do
  repo "https://github.com/sebastiangeiger/rails_sample_app.git"
  environment "RAILS_ENV" => "production"
  revision "HEAD"
  action :deploy
  user 'deploy'
  group 'deploy'
end
