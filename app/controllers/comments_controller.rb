class CommentsController < ApplicationController

    before_action :authenticate_user!
    def create
        @comment = current_user.comments.build(comment_params)
        p comment_params
        # binding.pry
        @post = @comment.post
        if @comment.save
            redirect_to posts_url
        end
    end
    def destroy
        @comment = Comment.find_by(id: params[:id])
        @post = @comment.post
        if @comment.destroy
            redirect_to posts_url
        end
    end
    private

        def comment_params
            # binding.pry
            p params
            params.require(:comment).permit(:post_id,:comment)
        end


end
