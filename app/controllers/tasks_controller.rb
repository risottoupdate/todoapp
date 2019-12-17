class TasksController < ApplicationController

  # ログインしていないユーザはログイン画面へ
  before_action :authenticate_user!

  # 一覧画面に対応するアクション
  def index
    @tasks = Task.where(user_id: current_user.id).order(limit_date: :asc)
  end

  # 新規作成画面に対応するアクション
  def new
    @task = Task.new
  end

  # 新規登録するためのアクション
  def create
    @task = Task.new(
      task: task_params[:task],
      state: task_params[:state],
      limit_date: task_params[:limit_date],
      user_id: current_user.id)
    if @task.save
      flash[:notice] = "タスクを追加しました"
      redirect_to("/tasks")
    else
      render("/tasks/new")
    end
  end

  # 編集するためのアクション
  def edit
    @task = Task.find(params[:id])
  end

  # 更新を行うためのアクション
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "タスクを編集しました"
      redirect_to("/tasks")
    else
      render("/tasks/edit")
    end
  end

  # 削除をするためのアクション
  def destroy
    task = Task.find(params[:id])
    task.delete
    flash[:notice] = "タスクを削除しました"
    redirect_to("/tasks")
  end

  private

  def task_params
    params.require(:task).permit(:task, :state, :limit_date)
  end

end