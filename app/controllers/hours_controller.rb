class HoursController < ApplicationController
  before_action :authenticate_user
  before_action :set_hours, only: [:show, :edit, :update, :destroy]


    def new
      @hour = Hour.new
      @all_projects = Project.all
      @all_developers = Developer.all
    end

    def index
      @hours = Hour.all
    end

    def edit
      @all_projects = Project.all
      @all_developers = Developer.all
    end

    def create
      @hour = Hour.new(hour_params)
      if @hour.save
        redirect_to hours_path, notice: "Hours were successfully created"
      else
        render 'new', notice: "Try again"
      end
    end

    def show
    end

    def update
      if @hour.update(hour_params)
        redirect_to hours_path, notice: 'Hours were successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @hour.destroy
      redirect_to hours_url, notice: 'Hours were successfully destroyed.'
    end

    private def set_hours
        @hour = Hour.find(params[:id])
      end

      def hour_params
        params.require(:hour).permit(:developer_id, :project_id, :worked_on, :duration)
      end


  end
