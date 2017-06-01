class LinksController < ApplicationController 

  def index
    @links = current_user.links
  end  

  def show
    @link = Link.find_by(:id => params[:id], :user_id => current_user.id)

    unless @link
      flash[:warning] = "Link not found"
      redirect_to links_path
    end
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

    def edit
    end 

    def update
    end 




end
