require 'app_options'

class DoorEventGenerator
  def initialize(opts={})
    @logger = nil
    AppOptions.instance.log "DoorEventGenerator initialize"
    @logger = Log4r::Logger['base::DoorEventGenerator'] || Log4r::Logger['base']
  end

  def start
    @logger.info "DoorEventGenerator start"
  end

  def stop
    @logger.info "DoorEventGenerator stop"
  end
end
