require "bosh/versions"

module Bosh::Cli::Command
  class Versions < Base
    include Bosh::Versions::Helpers

    usage 'gem latest version'
    desc 'Shows the latest version of BOSH gems'
    def show_bosh_gem_latest_version
      puts bosh_gem_latest_version
    end

    usage 'latest version'
    desc 'Shows the latest version of release (using bosh.io)'
    def show_latest_version(release)
      puts release_latest_version(release)
    end

  end
end
