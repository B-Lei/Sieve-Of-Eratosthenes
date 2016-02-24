# SieveOfEratosthenes.rb
# By Ben Lei
require 'sinatra'
require "slim"
require "inspectbang"
require "./Table.rb"

# Starting page
get '/' do
  slim :index
end

# Handles URLs with junk values, defaulting to index
get '/:input' do
  slim :index
end

# Displays table upon entering input
post '/1' do
  # Checks for valid input - if invalid, prompt for another input
  @input = params[:input]
  if !valid_input(@input) || @input.to_s.empty?
    slim :tryagain
  else
    # Simple math to determine the size of rows/columns based on input value
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

# Used for returning to index to input another value
post "/" do
  slim :index
end

# A regex function for checking valid input
def valid_input(input)
  /^[1-9]\d*$/ === input
end
