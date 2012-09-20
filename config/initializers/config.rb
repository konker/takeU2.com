# Load in the general config file if available
config = File.join( Rails.root, "config", "config.rb")
if File.exists? config
  require config
end

# Load in environment specific override config file if available
env_config = File.join( Rails.root, "config", "environments", "config.#{Rails.env}.rb")
if File.exists? env_config
  require env_config
end

