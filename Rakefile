require 'rake/testtask'
Dir[File.expand_path('lib/tasks/**/*.rb')].each(&method(:require))

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
