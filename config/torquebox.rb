TorqueBox.configure do
  service DoorEventGenerator

  job DatabaseCleaner do
    cron '45 */2 * * * ?'
    description 'Deliver queued mail notifications'
    config do
      days_old 8
    end
  end

end
