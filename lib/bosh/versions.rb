require "cli"
require "cli/validation"

module Bosh
  module Versions
    include BoshExtensions
  end
end

require "bosh/versions/helpers"
require "bosh/versions/version"
