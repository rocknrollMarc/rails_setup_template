# Global Redis instance.
REDIS = Redis::Namespace.new "rails-#{Rails.env}", redis: Redis.new
