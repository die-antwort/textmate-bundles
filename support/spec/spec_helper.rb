require 'rubygems'
require 'rspec/core'

ENV['TM_SUPPORT_PATH'] = '/Applications/TextMate.app/Contents/SharedSupport/Support'

RSpec.configure do |c|
  c.include(Module.new do
    def project_root
      @project_root ||= File.expand_path(File.join(File.dirname(__FILE__), '../fixtures'))
    end
  end)
end