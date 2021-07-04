class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_params(@article)
    end
    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
