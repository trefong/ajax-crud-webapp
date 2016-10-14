post '/bids/:id' do
  @bid = Bid.create(amount: params[:amount], user_id: current_user.id, item_id: params[:id])

  redirect "/items/#{params[:id]}"
end