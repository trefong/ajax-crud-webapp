get '/items' do
  @all_items = Item.order(created_at: :desc)
erb :"items/index"
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @bids = @item.bids.order(created_at: :desc)
  @won_items = @item.bids.where("bid_end < ?", Date.today)
  erb :"items/show"
end

post '/items/:id' do
  redirect "/items/#{params[:item_num]}"
end


post '/items' do
  Item.create(name: params[:item][:name], description: params[:item][:description], bid_start: params[:item][:bid_start], bid_end: params[:item][:bid_end], user_id: current_user.id)
  redirect "/users/#{session[:user_id]}"
end

get '/items/:id/edit' do
  @item = Item.find(params[:id])

  erb :"items/edit"
end

put '/items/:id' do
  @item = Item.find(params[:id])
  if @item
    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.bid_start = params[:item][:bid_start]
    @item.bid_end = params[:item][:bid_end]
    @item.save
  redirect "/users/#{session[:user_id]}"
else
  redirect "/items/#{@item.id}/edit"
end

end

delete '/items/:id' do
  @item = Item.find(params[:id])
  @item.destroy
  redirect "/users/#{session[:user_id]}"
end