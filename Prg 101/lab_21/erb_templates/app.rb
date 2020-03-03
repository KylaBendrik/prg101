require 'sinatra'

get('/fruits') do
  @items = %w[apples oranges pears]
  erb :list
end

get('/meats') do
  @items = %w[chicken beef lamb]
  erb :list
end