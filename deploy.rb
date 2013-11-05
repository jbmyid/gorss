require 'bundler/capistrano'
require 'capistrano_colors'
set :stages, %w[staging production]
set :default_stage, 'production'


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:keys] = ["~/Documents/JB/ruby/jbmyidinstance.pem "]

set :application, "gorss"
set :repository,  "git@heroku.com:gorss.git"
set :branch, "master"
set :deploy_to, "/var/www/gorss"
set :keep_releases, 3


set :scm, :git
set :user, "ubuntu"
set :use_sudo, false
set :deploy_via, :remote_cache

default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash -l'


role :web, "ec2-54-200-240-136.us-west-2.compute.amazonaws.com"
role :app, "ec2-54-200-240-136.us-west-2.compute.amazonaws.com"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy", "deploy:cleanup"