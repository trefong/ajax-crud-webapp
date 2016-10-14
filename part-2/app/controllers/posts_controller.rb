get "/posts" do
  @posts = Post.order("created_at DESC")
  erb :'posts/index'
end

post "/posts" do
  @post = Post.new(params[:post])

  if @post.save
    if request.xhr?
      erb :"posts/_post", layout: false, locals: {post: @post}
    else
      redirect "posts/#{@post.id}"
    end
  end
end

get "/posts/new" do
  @post = Post.new
  erb :'posts/new', layout: false
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :'posts/show'
end
