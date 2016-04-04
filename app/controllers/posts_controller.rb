class PostsController < ApplicationController
  #before_actions ensure that only verified users can access certain elements of posts. 
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /posts. This shows all posts on the app
  def index
    @posts = Post.all
  end

  # GET /posts/1. This allows us to view an individual post and replies
  def show
  end

  # GET /posts/new. Allows a user to create a new post
  def new
    @post = Post.new
  end

  # GET /posts/1/edit. Allows a user to edit a post 
  def edit
  end

  #CRUD operations below 
  # POST /posts. Method to create a new post and display message to user. 
  def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /posts/1. Method to update/edit a post and display message to user. 
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1. Method to delete a post and inform user it has been delete 
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #Authorize ensures a user is logged in to post/access a post. 
    def authorize
        if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
        else
        if @post && @post.user != current_user
        redirect_to root_path, alert: "Not authorized! Only #{@post.user} has access to this post."
        end
      end
    end 
    #Only allow verified users access
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
