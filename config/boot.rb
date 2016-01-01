ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'rails/commands/server'

module Rails
  class Server
    alias_method :default_options_alias, :default_options
    def default_options
      default_options_alias.merge!(Host: '0.0.0.0')
    end
  end
end
