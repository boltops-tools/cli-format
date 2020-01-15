require "active_support/core_ext/string"
require "cli_format/version"
require "cli_format/autoloader"
CliFormat::Autoloader.setup

module CliFormat
  class Error < StandardError; end
  # Your code goes here...

  def self.formats
    %w[csv table tab json]
  end
end
