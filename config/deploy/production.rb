host = %w(deploy@132.232.177.113)

role :app, host
role :web, host
role :db,  host

set :user, "deploy"
set :rails_env, :production
set :rack_env, :production
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :branch, 'master'

set :puma_env, fetch(:rails_env)
set :puma_threads, [2, 8]
set :puma_workers, 2
