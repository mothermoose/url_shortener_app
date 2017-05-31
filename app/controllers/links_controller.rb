class LinksController < ApplicationController 

  def index
    @links = current_user.links
  end  

  def new
    @link = Link.new
  end 

  def create 
    @link = Link.new(
      :slug => params[:slug], 
      :target_url => params[:target_url], 
      :user_id => current_user.id
      )
    
    @link.standardize_target_url!

    if @link.save
      flash[:success] = "Link created successfully"
      redirect_to links_path
    else
      render 'new'
    end
  end 



end
