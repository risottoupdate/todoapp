class TasksController < ApplicationController

  # 一覧画面に対応するアクション
  def index
    @tasks = Task.all
  end

  # 新規作成画面に対応するアクション
  def new
    @task = Task.new
  end

  # 新規登録するためのアクション
  def create
    Task.create(task_params)
  end

  def show
    @task = Task.find(params[:id])
  end

  # 編集するためのアクション
  def edit
    @task = Task.find(params[:id])
  end

  # 更新を行うためのアクション
  def update
    task = Task.find(params[:id])
    task.update(task_params)
  end

  # 削除をするためのアクション
  def destroy
    task = Task.find(params[:id])
    task.delete
  end

  private

  def task_params
    params.require(:task).permit(:task, :state, :limit_date)
  end

end