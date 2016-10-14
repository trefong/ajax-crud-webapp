get '/users/new' do
  erb :'sessions/register_form'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @items = @user.items.order(created_at: :desc)
  @bids = @user.bids.order(created_at: :desc)

  erb :'profile_page'
end