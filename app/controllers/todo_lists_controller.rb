class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy, :complete, :incomplete]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all.order('completed_at DESC')
    @todo_items = TodoItem.all
   
    # @todo_item = @todo_list.todo_items.all
    # puts ">>>>>>> #{@todo_lists.class}"
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    @todo_lists = TodoList.all
    @todo_items = TodoItem.all.order('completed_at DESC')
  end

  # GET /todo_lists/new
  def new
    @todo_list = current_user.todo_lists.build
  end

  # GET /todo_lists/1/edit
  def edit
    
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to root_path}
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    # @todo_item = @todo_list.todo_items.all
    # puts ">>>>>#{@todo_item}>>>>"
    @todo_list.destroy
    # check if the list is empty or not  
    respond_to do |format|
      format.html { redirect_to todo_lists_url}
      format.json { head :no_content }
    end
  end

  def complete
   
    @todo_list.update_attribute(:completed_at,Time.now)
    redirect_to root_path
  end

def incomplete
    @todo_list.update_attribute(:completed_at,nil)
    redirect_to root_path
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end