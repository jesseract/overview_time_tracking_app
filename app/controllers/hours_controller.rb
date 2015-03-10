class HoursController < ApplicationController
  before_action :set_hours, only: [:show, :edit, :update, :destroy]


    def new
      @hour = Hour.new
    end

    def index
      @hours = Hour.all
    end

    def edit
    end

    def create
      @hour = Hour.new(hour_params)
      if @hour.save
        redirect_to hours_path, notice: "Hour was successfully created"
      else
        render 'new', notice: "Try again"
      end
    end

    def show
    end

    def update
      if @hour.update(hour_params)
        redirect_to hours_path, notice: 'Hour was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @hour.destroy
      redirect_to hours_url, notice: 'Hour was successfully destroyed.'
    end

    private def set_developer
        @hour = Hour.find(params[:id])
      end

      def hour_params
        params.require(:hour).permit(:worked_on, :duration)
      end


  end
