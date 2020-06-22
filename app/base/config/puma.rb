environment ENV['RAILS_ENV']
threads *ENV['RAILS_THREADS'].split(':')
workers ENV['RAILS_WORKERS']

bind 'tcp://0.0.0.0:80'

if ENV['RAILS_ENV'] == 'development'
  worker_timeout 24*60*60
end

before_fork do
  ActiveRecord::Base.connection.disconnect!
end
on_worker_boot do
  ActiveRecord::Base.establish_connection
end

preload_app!
