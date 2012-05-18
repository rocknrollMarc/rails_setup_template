# Global Redis instance.
REDIS = Redis::Namespace.new "merc-#{Rails.env}", redis: Redis.new
