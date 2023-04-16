class ArticlesController < ApplicationController
before_action :set_articles, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(title: params[:article][:title], description: params[:article][:description])
    @article = Article.new(create_params)
    @article.user = User.first
    if @article.save!
      flash[:notice] = "Article was created succesfully"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(create_params)
      flash[:notice] = "article was updated"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


private

def create_params
  params.require(:article).permit(:title, :description)
  end

  def set_articles
    @article = Article.find(params[:id])
  end
end
