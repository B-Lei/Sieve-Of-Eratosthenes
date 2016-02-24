# SieveOfEratosthenes.rb
require 'sinatra'
require "slim"
require "inspectbang"
require "./Table.rb"

# Starting page
get '/' do
  slim :index
end

# Handles adding junk to url
get '/:input' do
  slim :index
end

# Displays table upon entering input
post '/1' do
  @input = params[:input]
  if !valid_input(@input) || @input.to_s.empty?
    slim :tryagain
  else
    @inputNumber = Integer(@input)
    @size = Math.sqrt(@inputNumber).ceil
    @col = @row = @size
    if @size == Math.sqrt(@inputNumber)
      @col += 1
    end
    @table = Table.new(@col,@row,@inputNumber)
    @table.sieve()
    slim :tableview
  end
end

post "/" do
  slim:index
end

# A regex function for checking valid input
def valid_input(input)
  /^[1-9]\d*$/ === input
end
