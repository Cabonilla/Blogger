class ArticlesController < ApplicationController
  before_action :require_login, except: [:show, :index]
  include ArticlesHelper 
  
  def index 
    @articles = Article.all
  end
  
  def show 
    @article = Article.find(params[:id]) 
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    
    flash.notice = "new article '#{@article.title}' created"
    
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.destroy(params[:id])
    
    flash.notice = "article destroyed"
    
    redirect_to action: "index"
  end
  
  def edit 
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    flash.notice = "article '#{@article.title}' updated"
    
    redirect_to article_path(@article)
  end
end

