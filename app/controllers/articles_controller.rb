class ArticlesController < ApplicationController
  # CRUD | retrieve
  def index # get articles
    @articles = Article.all
  end

  def show # get an article
    @article = Article.find(params[:id])
  end

  # CRUD | create
  def new # post an article
    @article = Article.new
  end

  def create # post cont.
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # CRUD | update
  def edit # fetches article from db, stores it in @article for form building. by default, renders .../edit.html.rb
    @article = Article.find(params[:id])
  end

  def update # refetches article fom db, updates it with submitted form data.
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # CRUD | delete
  def destroy # fetches article from db, calls destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
