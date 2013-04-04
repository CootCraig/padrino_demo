require 'rubygems'
require 'bundler/setup'

require 'pathname'
require 'log4r'
require 'log4r/yamlconfigurator'

class AppOptions
  include Singleton

  CONFIG_FILENAME = 'app.yml'

  attr_reader :app_config
  attr_reader :app_config_file

  def initialize
    @app_config = nil
    @app_config_file = nil
    @raw_log = nil
    @logger = nil

    set_config_file
    if @app_config_file
      begin
        @app_config = YAML.load_file(@app_config_file)
      rescue => ex
        @app_config = nil
      end
    end
    if @app_config
      begin
        Log4r::YamlConfigurator.load_yaml_file @app_config_file
        @logger = Log4r::Logger['base::AppOptions'] || Log4r::Logger['base']
        @raw_log.close if @raw_log
        @raw_log = nil
      rescue => ex
      end
    end
    unless @logger
      begin
        @raw_log = File.new('/var/log/torquebox/padrino_demo.log','a')
      rescue => ex
        @raw_log = nil
      end
    end
    log "AppOptions.initialize: @app_config_file #{@app_config_file}"
  end
  def log(msg)
    if @logger
      begin
        @logger.info msg
      rescue => ex
      end
    elsif @raw_log
      begin
        @raw_log.puts msg
        @raw_log.fsync
      rescue => ex
      end
    end
  end
  def set_config_file
    @app_config_file = nil
    cur_path = Pathname.new Dir.getwd
    cur_path.ascend do |pn|
      file_check = pn + CONFIG_FILENAME
      if file_check.file?
        @app_config_file = file_check.to_path
        return
      end
      file_check = pn + 'config'
      file_check = file_check + CONFIG_FILENAME
      if file_check.file?
        @app_config_file = file_check.to_path
        return
      end
    end
  end

end

