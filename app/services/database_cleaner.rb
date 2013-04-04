require 'app_options'

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
