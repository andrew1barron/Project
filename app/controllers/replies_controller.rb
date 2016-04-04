class RepliesController < ApplicationController
    # before_action ensure that only verified users can access certain elements of replies.
	before_action :authorize
	
    # Method allows a new reply to be created. 
    def create
		@post = Post.find(params[:post_id])
        @replyUserID = current_user.id
		@reply = @post.replies.create(reply_params)
        # puts line of code is here for checking if the user_id was being taken in 
        # This was used in debugging when linking replies to a user_id. 
        puts '////'
        puts @reply.inspect
        puts '////'
        if @reply.save
            redirect_to @post, notice: 'Reply was successfully created!' 
        else
            render :new
        end
	end 

    # Method allows a reply to be removed. 
	def destroy
		@post = Post.find(params[:post_id])
    	@reply = @post.replies.find(params[:id])
    	@reply.destroy
    	redirect_to @post, notice: "Comment deleted!"
    end 

	private
    # This sets the parameters required to create a reply 
	def reply_params
		params.require(:reply).permit(:commenter, :body, :user_id)
	end 
    # Ensures only verified users have access to certain replies. 
	def authorize
        if current_user.nil?
        redirect_to login_url, alert: "Please Log in or Sign Up to comment!"
      	end
    end 
end
