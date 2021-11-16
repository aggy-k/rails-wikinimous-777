class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @articles = Article.all
    # @articles = Article.where(published: true)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    # <input name="article[title]" >
    # parameters: { "article": {"title": "whatever the title is"} }
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      puts "ERROR! #{@article.errors.full_messages}"
      render "new"
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def publish
    @article.update(published: !@article.published)
    redirect_to @article
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :image_url)
    end
end
