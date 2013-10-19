class TasksController < ApplicationController
  inherit_resources

  respond_to :html
  respond_to :js, only: [ :create, :update, :destroy ]

  def create
    @task = CreateTask.create(params[:task].merge(user_id: current_user.id))
    create!
  end

  def index
    @tasks = Task.limit(10)
  end

  def show
    @task = Task.find(params[:id])
  end
end

