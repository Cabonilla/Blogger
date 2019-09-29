class TagsController < ApplicationController
  
  def index 
    @tag = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
    def destroy
    @tag = Tag.destroy(params[:id])
    
    flash.notice = "tag destroyed"
    
    redirect_to action: "index"
  end
  
end
