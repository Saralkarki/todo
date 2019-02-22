class TodoItemsController < ApplicationController
    before_action :set_todo_list
    def create
        @todo_item = @todo_list.todo_items.new(todo_items_params)
    respond_to do |format|  
        if @todo_item.save
            format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
            format.json { render :show, status: :created, location: @todo_list }
        else
            format.html { redirect_to @todo_list, notice: 'Could not save' }
            format.json { render :show, status: :created, location: @todo_list }
        end
    end
    end
    # def create
    #     @todo_item = @todo_list.todo_items.create(todo_items_params)
    #     redirect_to @todo_list
    # end

    def destroy
        @todo_item = @todo_list.todo_items.find(params[:id])
        if @todo_item.destroy
         flash[:success] = "Todo List item was deleted."
        else
         flash[:error] = "Todo List item could not be deleted."
        end
        redirect_to @todo_list 
       end

    private 
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
        # puts ">>>>>>" @todo_list
    end

    def todo_items_params 
        params[:todo_item].permit(:content)
    end


end
