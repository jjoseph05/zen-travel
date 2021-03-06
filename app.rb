require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
Dir["lib/**/*.rb"].each {|f| require "./#{f}"}

#
# Configuration
#

# Allow rendering of partials. See: https://gist.github.com/119874
helpers Sinatra::Partials

configure do
  # Default Haml format is :xhtml
  set :haml, { :format => :html5 }
end

configure :development do
  require "sinatra/reloader"
end

configure :production do
  set :haml, { :ugly => true }
end


#
# Helpers
#
helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end


#
# Routes
#

not_found do
  redirect '/404.html'
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}"
end

#Flights=================================#

get "/" do
  haml :index
end

get "/flightresults" do
  haml :flightresults
end

get "/flightreservation" do
  haml :flightreservation
end

get "/finalsummary" do
 haml :finalsummary  
end

#Hotels=================================#

get "/hotels" do
  haml :hotels  
end

get "/hotelresults" do
  haml :hotelresults
end

get "/hotelreservation" do
  haml :hotelreservation  
end

#Cars=================================#

get "/cars" do
  haml :cars  
end

get "/carresults" do
  haml :carresults
end

get "/carreservation" do
  haml :carreservation
end

#Deals=================================#

get "/deals" do
  haml :deals
end
