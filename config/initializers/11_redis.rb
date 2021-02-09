connection = YAML.load(File.open('config/redis.yml')).fetch(Rails.env)
$redis = Redis.new(
  driver: 'hiredis',
  host: connection['host'],
  port: connection['port'],
  timeout: 30
)
