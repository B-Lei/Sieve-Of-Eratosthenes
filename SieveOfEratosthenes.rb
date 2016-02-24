# SieveOfEratosthenes.rb
require 'sinatra'
require "slim"
require "inspectbang"
require "./Table.rb"

# Starting page
get '/' do
  slim :index
end

# Displays table upon entering input
post '/' do
  @input = params[:input]
  slim :input
  @inputNumber = Integer(@input)
  @size = Math.sqrt(@inputNumber).ceil
  @table = Table.new(@size,@size,@inputNumber)
  slim :tableview
end
