set :keep_releases, 5
set :application,   'Yizkor'
set :repository,    'git@github.com:wwwjscom/yizkor-rails.git'
set :deploy_to,     "/www/#{application}"
set :deploy_via,    :export
set :monit_group,   "#{application}"
set :scm,           :git
set :git_enable_submodules, 1
# This is the same database name for all environments
set :production_database,'Yizkor_production'

set :environment_host, 'localhost'
set :deploy_via, :remote_cache

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:pty] = true # required for svn+ssh:// andf git:// sometimes

# This will execute the Git revision parsing on the *remote* server rather than locally
#set :real_revision, 			lambda { source.query_revision(revision) { |cmd| capture(cmd) } }


task :staging do
  set :branch, "development"
  role :web, '174.129.10.127'
  role :app, '174.129.10.127'
  role :db, '174.129.10.127', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'deploy'
  set :dbpass,        'HwlvVBfVYs'
  set :user,          'deploy'
  set :password,      'HwlvVBfVYs'
  set :runner,        'deploy'
  set :rails_env,     'production'
end


task :production do
  set :branch, "master"
  role :web, '174.129.10.160'
  role :app, '174.129.10.160'
  role :db, '174.129.10.160', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'deploy'
  set :dbpass,        'lgffQVpnfg'
  set :user,          'deploy'
  set :password,      'lgffQVpnfg'
  set :runner,        'deploy'
  set :rails_env,     'production'
end


task :slicehost do
  set :branch, "master"
  role :web, '67.23.6.217'
  role :app, '67.23.6.217'
  role :db, '67.23.6.217', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'root'
  set :dbpass,        'xacut3lit3'
  set :user,          'wwwjscom'
  set :password,      'eDw)$Y3|'
  set :runner,        'wwwjscom'
  set :rails_env,     'production'
end

# TASKS
# Don't change unless you know what you are doing!

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"

