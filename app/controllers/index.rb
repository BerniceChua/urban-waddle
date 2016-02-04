get '/' do
  # Look in app/views/index.erb
  # @all_coordinates = Coordinate.all

  @coordinate = Coordinate.new(address: params[:address], latitude: params[:latitude], longitude: params[:longitude])

  if @coordinate.save
    redirect "/coordinates/#{@coordinate.id}"
  else
    @errors = @coordinate.errors.full_messages
  end

  erb :index
end
