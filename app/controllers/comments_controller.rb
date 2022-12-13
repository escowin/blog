class CommentsController < ApplicationController
    # only authenticated users can delete comments
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    # POST
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    # DELETE
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body, :status)
        end
end
