class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_item, except: [:create]
  
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

  def complete
    @item.update_attribute(:completed_at, Time.now)
    redirect_to @todo, notice: "Item completed"
  end
  
  private
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    def set_item
      @item = @todo.items.find(params[:id])
    end
    
    def item_params
      params[:item].permit(:content)
    end
end