#!/usr/bin/env ruby

require 'fileutils'

files = [ "gitconfig", "vim", "vimrc", "zshrc" ]

if (RUBY_PLATFORM =~ /linux|darwin/) != nil
  puts "Running on on linux or Mac. including tmux.conf"
  files << "tmux.conf"
end

files.each { |file|
  fullpath = ENV['HOME'] + "/." + file

  if File.exists? fullpath
    puts "Removing #{fullpath}..."
    if File.file? fullpath
      File.delete fullpath
    else
      FileUtils.rm_rf fullpath
    end
  end

  puts "linking " + File.dirname(__FILE__) + "/#{file}" + " to " + fullpath
  File.symlink File.dirname(__FILE__) + "/#{file}", fullpath
}
