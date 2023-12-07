# frozen_string_literal: true

require 'active_support'
require 'readline'
require 'pry'
require 'pry-rails'
require 'pry-byebug'
require 'pry-byebug/pry_remote_ext'
require 'pry-remote-reloaded'

module FunkHands; end

require 'funk_hands/version'
require 'funk_hands/railtie' if defined?(Rails)
