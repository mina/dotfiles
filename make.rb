#!/usr/bin/env ruby

require 'fileutils'

files = [ "gitconfig", "vim", "vimrc", "zshrc" ]

if (RUBY_PLATFORM =~ /linux|darwin/) != nil
  puts "Running on on linux or Mac. including tmux.conf"
  files << "tmux.conf"
end

files.each { |file|
  fullpath = ENV['HOME'] + "/." + file
  puts fullpath

  if File.exists? fullpath
    puts "Removing #{fullpath}..."
    if File.file? fullpath
      File.delete fullpath
    else
      FileUtils.rm_rf fullpath
    end
  else
    puts "#{fullpath} not found..."
  end

  puts "linking " + File.realpath(File.dirname(__FILE__)) + "/#{file}" + " to " + fullpath
  File.symlink((File.realpath(File.dirname(__FILE__)) + "/#{file}"), fullpath)
}
