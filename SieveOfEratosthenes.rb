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
  @size = Math.sqrt(Integer(@input))
  if @size == @size.floor
    @numcolumns = @numrows = @size.floor
  elsif @size-@size.floor <= 0.5
    @numcolumns = @numrows = @size.floor
    @numcolumns += 1
  else #@size-@size.floor > 0.5
    @numcolumns = @numrows = @size.ceil
  end
  @table = Table.new(@numcolumns,@numrows)
  slim :tableview
end
