class ProjectsController < ApplicationController
  before_action :authenticate_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]


    def new
      @project = Project.new
      @all_projects = Project.all
    end

    def index
      @projects = Project.all
    end

    def edit
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to projects_path, notice: "Project was successfully created"
      else
        render 'new', notice: "Try again"
      end
    end

    def show
    end

    def update
      if @project.update(project_params)
        redirect_to projects_path, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
    end

    private def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:max_hours, :project_name)
      end


  end
