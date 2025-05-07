class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    if @user.present?
      @habits = current_user.try(:habits)
    end
  end
end
