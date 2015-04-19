# Cookbook Name:: my_app
# Recipe:: default
#
include_recipe "my_app::ruby"
include_recipe "my_app::git"
include_recipe "postgresql::client"
include_recipe "postgresql::server"
