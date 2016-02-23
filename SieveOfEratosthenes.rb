# SieveOfEratosthenes.rb
require 'sinatra'
require "slim"

get '/' do
  slim :index
end

get '/:input' do
  @input = params[:input].split('-').join(' ').capitalize
  slim :input
end

post '/' do
  @input = params[:input]
  slim :input
end
