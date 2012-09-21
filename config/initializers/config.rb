require 'erb'
require 'yaml'

# Load in the general config file if available
config = {}
f = File.join( Rails.root, "config", "config.yml")
if File.exists? f
  config = YAML::load(ERB.new(IO.read(f)).result)
  config.each do |key, value|
    ENV[key] = value
  end
end

# Load in environment specific override config file if available
f = File.join( Rails.root, "config", "environments", "config.#{Rails.env}.yml")
if File.exists? f
  config = YAML::load(ERB.new(IO.read(f)).result)
  config.each do |key, value|
    ENV[key] = value
  end
end

