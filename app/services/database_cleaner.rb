require 'pathname'
require 'log4r'
require (Pathname.new(File.dirname(File.expand_path(__FILE__))) + '../../lib/app_options').to_s
require (Pathname.new(File.dirname(File.expand_path(__FILE__))) + '../../models/event').to_s

class DatabaseCleaner
  # optional, only needed if you pass config options to the job
  def initialize(options = {})
    @options = options
    @logger = nil
    AppOptions.instance.log "DatabaseCleaner initialize options #{@options}"
    @logger = Log4r::Logger['base::DatabaseCleaner'] || Log4r::Logger['base']
  end

  def run()
    # perform work here
    @logger.info "DatabaseCleaner.run options #{@options}"
  end

  def on_error(exception)
    # Optionally implement this method to interrogate any exceptions
    # raised inside the job's run method.
  end
end
