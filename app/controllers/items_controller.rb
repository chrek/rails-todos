class ItemsController < ApplicationController
  before_action :set_todo
  
  def create
    @item = @todo.items.create(item_params)
    redirect_to @todo
  end

  def destroy
    @item = @todo.items.find(params[:id])
    if @item.destroy
      flash[:success] = "The item for this Todo was deleted."
    else
      flash[:error] = "The item for this Todo could not be deleted."
    end
    redirect_to @todo 
  end
  
  private
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end
    
    def item_params
      params[:item].permit(:content)
    end
end