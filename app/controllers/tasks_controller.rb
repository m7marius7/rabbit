class TasksController < ApplicationController

    before_action :find_task, only: [:show, :edit, :update, :destroy]
    # before_filter :no_index_no_follow

    def index
        if params[:category].blank?
        @tasks = Task.all.order("created_at DESC")
        else
            @category_id = Category.find_by(name: params[:category]).id
            @tasks = Task.where(category_id: @category_id).order("created_at DESC")
        end
    end

    def show
        # @meta_title = @task.meta_title
    end

    def new
        @meta_title = "title new task"
        @meta_description = "description new task"
        no_index_no_follow
        @task = Task.new
    end



    def edit
        @meta_title = "title edit task"
        @meta_description = "description edit task"
    end

    # def create
    #     @task = Task.new(task_params)

    #     respond_to do |format|
    #         if @task.save
    #             format.turbo_stream
    #             format.html { redirect_to task_url(@task), notice: "Tascul was successfully created." }
    #             format.json { render :show, status: :created, location: @task }
    #         else
    #             format.html { render :new, status: :unprocessable_entity }
    #             format.json { render json: @task.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to @task
        else
            render "New"
        end
    end

    def update
        if @task.update(task_params)
            redirect_to @task
        else
            render "edit"
        end
    end


    # def update
    #     respond_to do |format|
    #         if @task.update(task_params)
    #             format.turbo_stream
    #             format.html { redirect_to @task, notice: "Room was successfully created." }
    #             format.json { render :show, status: :created, location: @task }
    #         else
    #             format.html { render :edit, status: :unprocessable_entity }
    #             format.json { render json: @task.errors, status: :unprocessable_entity }
    #         end
    #     end

    # end

    def destroy
        @task.destroy
        redirect_to root_path
    end
    # def destroy
    #     @task.destroy
    
    #     respond_to do |format|
    #       format.turbo_stream
    #       format.html { redirect_to tasks_url, notice: "Note was successfully destroyed." }
    #       format.json { head :no_content }
    #     end
    #   end
    
   

    private 

    def find_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :description, :company, :url, :category_id)
    end
    
end
