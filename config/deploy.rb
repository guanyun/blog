require 'mina/bundler'
require 'mina/git'
require 'mina/rbenv'

set :user, 'ubuntu'
set :domain, 'guanyun.cn'
set :deploy_to, '/var/www/blog'
set :repository, 'git@github.com:h0mebrew/blog.git'
set :branch, 'master'

task :environment do
  invoke :'rbenv:load'
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'
    queue echo_cmd "#{bundle_prefix} jekyll build"
  end
end
