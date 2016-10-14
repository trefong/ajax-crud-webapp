get '/login' do

  erb :'sessions/login_form'
end

post '/login' do
  user = User.find_by(user_name: params[:user][:user_name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end