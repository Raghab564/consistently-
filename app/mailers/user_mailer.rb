class UserMailer < ApplicationMailer
  default from: "no-reply@yourapp.com"

  def weekly_summary(user)
    @user = user
    @habits = user.habits.where("updated_at >= ?", 1.week.ago)
    mail(to: @user.email, subject: "Your Weekly Habit Summary")
  end
end
