require 'rubygems'
require 'bundler'
Bundler.require

require File.dirname(__FILE__) + '/app.rb'
run Sinatra::Application
