class RepliesController < ApplicationController
	before_action :authorize
	def create
		@post = Post.find(params[:post_id])
        @replyUserID = current_user.id
		@reply = @post.replies.create(reply_params)
        # puts line of code is here for checking if the user_id was being taken in 
        puts '////'
        puts @reply.inspect
        puts '////'
        if @reply.save
            redirect_to @post, notice: 'Reply was successfully created!' 
        else
            render :new
        end
	end 
	def destroy
		@post = Post.find(params[:post_id])
    	@reply = @post.replies.find(params[:id])
    	@reply.destroy
    	redirect_to @post, notice: "Comment deleted!"
    end 

	private
	def reply_params
		params.require(:reply).permit(:commenter, :body, :user_id)
	end 

	def authorize
        if current_user.nil?
        redirect_to login_url, alert: "Please Log in or Sign Up to comment!"
      	end
    end 
end
