class PostsController < ApplicationController

	def index
		@posts = Post.where(:user_id => current_user.id)
	end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)

    @post = Post.create(post_params)
  	@post.save
				
		redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

      if @post.update(post_params.permit(:title, :content))
        redirect_to @post
      else 
        render 'edit'
      end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy

  	redirect_to posts_path
  end

private
  def post_params
  	params.require(:post).permit(:title, :content).merge(user: current_user)
  end









end
