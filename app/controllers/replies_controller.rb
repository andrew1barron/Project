class RepliesController < ApplicationController
	before_action :authorize
	def create
		@post = Post.find(params[:post_id])
		#@replier = User.find(params[:user_id])
		@reply = @post.replies.create(reply_params)
		redirect_to post_path(@post)
	end 
	def destroy
		@post = Post.find(params[:post_id])
    	@reply = @post.replies.find(params[:id])
    	@reply.destroy
    	redirect_to post_path(@post)
    end 

	private
	def reply_params
		params.require(:reply).permit(:commenter, :body)
	end 

	def authorize
        if current_user.nil?
        redirect_to login_url, alert: "Please Log in or Sign Up to comment!"
        #else
        #if @post && @post.user != current_user
        #redirect_to root_path, alert: "Not authorized! Only #{@post.user} has access to this post."
        #end
      	end
    end 

    #def replier
    #	@replier = current_user.find(params[:user_id])
    #end 
end
