class ParentsController < ApplicationController
  def show
    @parent = Parent.find(params[:id])
  end

  def index
    @parents = Parent.all
  end
  
  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:success] = "You have successfully added a new parent :)"
      redirect_to @parent
    else
      render 'new'
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :email, :address, :phone_number, :password, :password_confirmation)
  end
end
