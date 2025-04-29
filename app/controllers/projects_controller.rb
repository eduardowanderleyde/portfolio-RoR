class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Projeto criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Projeto atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Projeto excluído com sucesso.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :technologies, :github_link, :deploy_link, :image)
  end

  def ensure_owner
    unless @project.user == current_user
      redirect_to projects_path, alert: 'Você não tem permissão para realizar esta ação.'
    end
  end
end 