#!/usr/bin/env ruby

require "fileutils"

BUNDLES = {
  "JavaScript JSLintMate.tmbundle" => "git://github.com/rondevera/jslintmate.git"
}

Dir.chdir(File.dirname(__FILE__) + "/../") do
  FileUtils.mkdir_p("Pristine Copy/Bundles", :verbose => true) unless File.directory?("Pristine Copy/Bundles")
  Dir.chdir("Pristine Copy/Bundles") do
    BUNDLES.each do |dir, git_url|
      if File.directory?(dir)
        Dir.chdir(dir) do
          puts "\n=> Updating '#{dir}'"
          system "git pull"
        end
      else
        puts "\n=> Installing '#{dir}' from #{git_url}"
        system "git", "clone", git_url, dir
      end
    end
  end
end