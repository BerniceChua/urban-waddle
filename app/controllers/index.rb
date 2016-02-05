get '/' do
  # Look in app/views/index.erb
  @all_coordinates = Coordinate.all
  erb :index
end
