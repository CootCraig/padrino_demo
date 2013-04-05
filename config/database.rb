require 'pathname'
require 'java'
require (Pathname.new(File.dirname(File.expand_path(__FILE__))) + '../lib/postgresql-9.2-1002.jdbc4.jar').to_s

Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_development?user=padrino_demo&password=password", :loggers => [logger])
  when :production  then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_production?user=padrino_demo&password=password",  :loggers => [logger])
  when :test        then Sequel.connect("jdbc:postgresql://localhost/padrino_demo_test?user=padrino_demo&password=password",        :loggers => [logger])
end

