#!/usr/bin/env ruby

require "thor"
require "yaml"

class UpstreamUrlTool < Thor
  FILENAME = "upstream-urls.yml"
  
  desc "dump", "dump upstream URLs of all submodules to '#{FILENAME}'"
  def dump
    urls = {}

    Dir.chdir(File.dirname(__FILE__)) do
      submodules.each do |mod|
        url = `cat ".git/modules/#{mod}/config" | grep 'remote "upstream"' -A 3 | grep "url = " | cut -d= -f2`.strip
        if url != ""
          urls[mod] = url
        else
          puts "WARNING: No remote named 'upstream' found for #{mod} - ignoring."
        end
      end
      File.open(FILENAME, "w") do |f|
        f.puts YAML.dump(urls)
      end
    end
    puts "Successfully dumped all upstream urls to #{FILENAME}"
  end

  desc "set", "set upstream URLs for all submodule from '#{FILENAME}'"
  def set
    puts "Setting upstream URLs"
    YAML.load_file(FILENAME).each do |mod, url|
      Dir.chdir(File.dirname(__FILE__) + "/#{mod}") do
        output = `git remote add upstream #{url} 2>&1`
        if !$?.success? && output =~ /remote upstream already exists/
          output = `git remote set-url upstream #{url} 2>&1`
        end
        puts ($?.success? ? "✅  " : "💥  ") + "#{mod} => #{url}"
        puts output unless $?.success?
      end
    end
    puts "\nDone!"
  end
  
  private
  
  def submodules
    File.readlines(".gitmodules").map{ |line| 
      line =~ /^\s*path\s*=\s*(.*)\s*$/ && $1 
    }.compact.sort_by(&:downcase)
  end 
end

UpstreamUrlTool.start
