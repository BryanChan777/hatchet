require 'active_support/core_ext/object/blank'
require 'rrrretry'
require 'repl_runner'

require 'json'
require 'stringio'
require 'fileutils'
require 'stringio'
require 'date'

module Hatchet
    APP_PREFIX = (ENV['HATCHET_APP_PREFIX'] || "hatchet-t-")
end

require 'hatchet/version'
require 'hatchet/reaper'
require 'hatchet/test_run'
require 'hatchet/app'
require 'hatchet/anvil_app'
require 'hatchet/git_app'
require 'hatchet/config'
require 'hatchet/api_rate_limit'

module Hatchet
  RETRIES = Integer(ENV['HATCHET_RETRIES']   || 1)
  Runner  = Hatchet::GitApp

  def self.git_branch
    return ENV['TRAVIS_BRANCH'] if ENV['TRAVIS_BRANCH']
    out = `git describe --contains --all HEAD`.strip
    raise "Attempting to find current branch name. Error: Cannot describe git: #{out}" unless $?.success?
    out
  end

  if ENV["HATCHET_DEBUG_DEADLOCK"]
    Thread.new do
      loop do
        sleep ENV["HATCHET_DEBUG_DEADLOCK"].to_f # seconds
        Thread.list.each { |t| puts "=" * 80; puts t.backtrace }
      end
    end
  end
end
