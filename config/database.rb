require 'java'
require Padrino.root('config','postgresql-9.2-1002.jdbc4.jar')

Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_development?user=padrino_demo&password=password", :loggers => [logger])
  when :production  then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_production?user=padrino_demo&password=password",  :loggers => [logger])
  when :test        then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_test?user=padrino_demo&password=password",        :loggers => [logger])
end

