$:.unshift(File.dirname(__FILE__) + '/../../rspec/lib')
require 'rubygems'
require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'support/spec/**/*_spec.rb'
  t.rcov = true
  t.rcov_opts = ['--exclude', 'TextMate.app,gem,rspec\/plugins,rspec\/lib\/spec,spec\/spec,fixtures,bin\/spec']
end

task :default => :spec

Dir['support/bundle_tasks/**/*.rake'].each { |rake| load rake }
