set :application, "yizkor_books"
set :repository,  "git@github.com:wwwjscom/yizkor-rails.git"
set :scm, :git
set :deploy_to, '/www/yizkor_books'
set :runner, 'wwwjscom'
set :branch, "master"
set :deploy_via, :remote_cache

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

server "vividsounds", :app, :web, :db, :primary => true
