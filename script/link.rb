#!/usr/bin/env ruby
project = ARGV[0] or raise 'no project given'

path    = File.expand_path("~/Sites/#{project}")
File.exists?(path) or raise "project #{path} does not exist"

`rm -r output`

%w(
  content
  layouts
  rules_preprocess.rb
  rules_compile.rb
  config.yaml
  lib/filters_local.rb
  lib/helpers_local.rb
).each do |file|
  `rm -r #{file}`
  if File.exists?("#{path}/#{file}")
    `ln -sf #{path}/#{file} #{file}`
  end
end
puts "ok."
