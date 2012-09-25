require 'erb'
require 'yaml'

# copy config parameters to ENV
def load_to_env(config, path='')
  # helper to form a '.' separated path
  def path_key(path, key)
    if path == ''
      key
    else
      "#{path}.#{key}"
    end
  end

  config.each do |key, value|
    if value.kind_of? String or value.kind_of? Fixnum
      # Copy straight to ENV
      ENV[path_key(path, key)] = value
    elsif value.kind_of? Hash
      # Recurse into sub-hash, appending the current key to the path
      load_to_env(value, path_key(path, key))
    else
      raise "Config elements must be String, Fixnum or Hash"
    end
  end
end

# Load in the general config file if available
config = {}
f = File.join( Rails.root, "config", "config.yml")
if File.exists? f
  config = YAML::load(ERB.new(IO.read(f)).result)
  load_to_env(config)
end

# Load in environment specific override config file if available
f = File.join( Rails.root, "config", "environments", "config.#{Rails.env}.yml")
if File.exists? f
  config = YAML::load(ERB.new(IO.read(f)).result)
  load_to_env(config)
end

