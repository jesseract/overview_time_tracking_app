class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]


  def new
    @developer = Developer.new
  end

  def index
    @developers = Developer.all
  end

  def edit
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      redirect_to developers_path, notice: "Developer was successfully created"
    else
      render 'new', notice: "Try again"
    end
  end

  def show
  end

  def update
    if @developer.update(developer_params)
      redirect_to developers_path, notice: 'Developer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @developer.destroy
    redirect_to developers_url, notice: 'Developer was successfully destroyed.'
  end

  private def set_developer
      @developer = Developer.find(params[:id])
    end

    def developer_params
      params.require(:developer).permit(:email, :password)
    end


end
