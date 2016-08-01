require 'yaml'

module StudyGroupFaker
  module Config
    extend self

    class ConfigError < StandardError
    end

    DEFAULT_CONFIG_FILE = File.join(File.dirname(__FILE__), 'sgfaker.yaml')
    ALLOWABLE_CONFIG_VALUES = ["use_middle_name", "allow_suffixes"]

    def config_file
      @config ||= YAML.load_file(DEFAULT_CONFIG_FILE)
    end

    def config_for(key)
      config_file[key]
    end

    def set_config(key: , value: )
      raise ConfigError, "NOOOOOOOOOOOOOOOOOOO" unless ALLOWABLE_CONFIG_VALUES.include? key
      config_file[key] = value
      File.open(DEFAULT_CONFIG_FILE, 'w') { |file| file.write config_file.to_yaml }
    end
  end
end
