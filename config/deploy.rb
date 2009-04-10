set :application, "yizkor_books"
set :repository,  "git@github.com:wwwjscom/yizkor-rails.git"
set :scm, :git
set :deploy_to, '/www/yizkor_books'
set :runner, 'root'
#set :use_sudo, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

server "vividsounds", :app, :web, :db, :primary => true

#namespace :deploy do
#  namespace :web do
#    task :disable, :roles => :web do
#      # invoke with  
#      # UNTIL="16:00 MST" REASON="a database upgrade" cap deploy:web:disable
#
#      on_rollback { rm "#{shared_path}/system/maintenance.html" }
#
#      require 'erb'
#      deadline, reason = ENV['UNTIL'], ENV['REASON']
#      maintenance = ERB.new(File.read("./app/views/layouts/maintenance.html.erb")).result(binding)
#
#      put maintenance, "#{shared_path}/system/maintenance.html", :mode => 0644
#    end
#  end
#end
