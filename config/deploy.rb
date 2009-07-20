set :keep_releases, 5
set :application,   'yizkor_books'
set :repository,    'git@github.com:wwwjscom/yizkor-rails.git'
set :deploy_to,     "/www/#{application}"
set :deploy_via,    :export
set :monit_group,   "#{application}"
set :scm,           :git
set :branch, "master"
set :git_enable_submodules, 1
set :user, "wwwjscom"
ssh_options[:port] = 6969

# This is the same database name for all environments
#set :production_database,'Yizkor_production'

set :environment_host, 'localhost'
set :deploy_via, :remote_cache

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:pty] = true # required for svn+ssh:// andf git:// sometimes


# Deployment servers
role :app, "67.23.6.217"
role :web, "67.23.6.217"
role :db,  "67.23.6.217", :primary => true


# TASKS
# Don't change unless you know what you are doing!

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"

