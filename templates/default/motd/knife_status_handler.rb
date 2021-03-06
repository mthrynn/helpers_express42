# Copied from https://github.com/chr4-cookbooks/motd and slightly edited
# Copyright 2012, Chris Aumann <me@chr4.org>

require 'chef/handler'

module Motd
  # Class for reporting last succesful run status to file
  class KnifeStatus < Chef::Handler
    def initialize; end

    def report
      return unless run_status.success?
      File.open("#{Chef::Config[:file_cache_path]}/last_successful_chef_run", 'w') do |file|
        file.write Time.now.to_i
      end
    end
  end
end
