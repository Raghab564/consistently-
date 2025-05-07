class HabitCheckinsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_habit
  
    def create
      date = params[:date].present? ? Date.parse(params[:date]) : Date.today
      checkin = @habit.habit_checkins.find_or_initialize_by(date: date)
  
      if checkin.persisted?
        flash[:notice] = "Already marked as done for #{date}."
      elsif checkin.save
        flash[:notice] = "Habit marked as done for #{date}."
      else
        flash[:alert] = "Could not mark habit as done."
      end
  
      redirect_to @habit
    end
  
    def destroy
      checkin = @habit.habit_checkins.find_by(date: params[:date])
  
      if checkin&.destroy
        flash[:notice] = "Check-in removed."
      else
        flash[:alert] = "Could not remove check-in."
      end
  
      redirect_to @habit
    end
  
    private
  
    def set_habit
      @habit = Habit.find(params[:habit_id])
    end
  end
  