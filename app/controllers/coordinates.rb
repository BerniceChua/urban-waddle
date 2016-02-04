get "/coordinates/new" do
  erb :"/coordinates/new"
end

post "/coordinates" do
  @coordinate = Coordinate.new(address: params[:address], latitude: params[:latitude], longitude: params[:longitude])

  if @coordinate.save
    redirect "/coordinates/#{@coordinate.id}"
  else
    @errors = @coordinate.errors.full_messages
  end

end

get "/coordinates/:id" do
  @coordinate = Coordinate.find(params[:id])

  if @errors
    @errors = @coordinate.errors.full_messages
    erb :"/coordinates/_not_logged_in_not_current_coordinate_error_message"
  end

  erb :"/coordinates/show"
end

get "/coordinates/:id/edit" do
  @coordinate = Coordinate.find(params[:id])

  if @errors
    @errors = @coordinate.errors.full_messages
    erb :"/coordinates/_not_logged_in_not_current_coordinate_error_message"
  end

  erb :"/coordinates/edit"
end

put "/coordinates/:id" do
  @coordinate = Coordinate.find(params[:id])

  if @errors
    @errors = @coordinate.errors.full_messages
    erb :"/coordinates/_not_logged_in_not_current_coordinate_error_message"
  end

  @coordinate.update_attributes(first_name: params[:first_name])
  @coordinate.update_attributes(last_name: params[:last_name])
  @coordinate.update_attributes(email: params[:email])
  @coordinate.update_attributes(password: params[:password])
  redirect "/coordinates/#{@coordinate.id}"
end

delete "/coordinates/:id" do
  @coordinate = Coordinate.find(params[:id])

  if @errors
    @errors = @coordinate.errors.full_messages
    erb :"/coordinates/_not_logged_in_not_current_coordinate_error_message"
  end

  @coordinate.destroy
  redirect '/'
end
