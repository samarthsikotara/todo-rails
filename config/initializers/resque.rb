# require 'resque/scheduler'
#require 'resque/scheduler/server'
Resque.logger = MonoLogger.new(File.open("#{Rails.root}/log/resque.log", "w+"))
Resque.logger.formatter = Resque::QuietFormatter.new
#Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_scheduler.yml")
uri = URI.parse("redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis = REDIS
Resque.redis.namespace = "resque:clearfunds_production"