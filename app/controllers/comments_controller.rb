class CommentsController < ApplicationController
    def create
        @news = News.find(params[:news_id])
        @comment = @news.comments.create(comment_params)
        redirect_to news_path(@news)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter,:email, :body)
    end
end
