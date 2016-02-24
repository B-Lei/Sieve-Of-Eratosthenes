# SieveOfEratosthenes.rb
require 'sinatra'
require "slim"
require "./Table.rb"

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
  @size = Math.sqrt(Integer(@input))
  @numcolumns = @size.floor
  @numrows = @size.floor
  if @size != @size.floor
    @numrows += 1
  end
  @table = Table.new(@numcolumns,@numrows)
  slim :tableview
end
