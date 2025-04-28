class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = current_user.experiences.ordered
  end

  def show
  end

  def new
    @experience = current_user.experiences.build
  end

  def edit
  end

  def create
    @experience = current_user.experiences.build(experience_params)

    if @experience.save
      redirect_to @experience, notice: 'Experiência criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to @experience, notice: 'Experiência atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_url, notice: 'Experiência excluída com sucesso.'
  end

  private

  def set_experience
    @experience = current_user.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:company, :role, :start_date, :end_date, :description)
  end
end 