# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "scrm_mirror"
set :repo_url, "https://halobrys@bitbucket.org/halobrys/scrm_mirror.git"

set :rvm_ruby_version, '2.4.4'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV["branch"] || "master"

# Default deploy_to directory is /var/www/my_app_name

set :deploy_via, :remote_cache

set :normalize_asset_timestamps, false

set :log_file, :info

set :pty, true

append :linked_files, "config/database.yml", "config/secrets.yml"

append :linked_files, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "node_modules"

set :keep_releases, 5

# puma config
set :puma_bind, "tcp://0.0.0.0:3080"
set :puma_preload_app, true
set :puma_prune_bundler, true
set :puma_tag, fetch(:application)
set :puma_worker_timeout, 60
set :puma_rolling_restart, true
set :puma_rolling_wait, 15
set :puma_rolling_groups, 1
