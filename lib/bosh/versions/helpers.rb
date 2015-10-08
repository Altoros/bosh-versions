require 'rest-client'
require 'rubygems_api'

module Bosh
  module Versions
    module Helpers

      def bosh_gem_latest_version
        client = Rubygems::API::Client.new
        response = client.gem_info('bosh-core')
        response.body['version']
      end

      def release_latest_version(release)
        release = "cloudfoundry/#{release}" unless release.include?('/')
        release_page_html = RestClient.get("http://bosh.io/releases/github.com/#{release}")
        version_match = release_page_html.match /https:\/\/bosh.io\/d\/github.com\/#{release}\?v\=(\d+)/
        raise "unknown release or release version" unless version_match
        version_match[1]
      end

    end
  end
end
