class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_checkins, dependent: :destroy
  validates :name, presence: true



  def done_dates
    habit_checkins.order(date: :asc).pluck(:date)
  end

  def current_streak
    streak = 0
    today = Date.today
    dates = done_dates.reverse

    dates.each do |date|
      if date == today || date == today - streak
        streak += 1
      else
        break
      end
    end

    streak
  end

  def longest_streak
    dates = done_dates.sort
    longest = current = 1

    dates.each_cons(2) do |a, b|
      if b == a + 1
        current += 1
        longest = [longest, current].max
      else
        current = 1
      end
    end

    dates.empty? ? 0 : longest
  end

  def consistency_percentage
    total_days = (Date.today - created_at.to_date).to_i + 1
    done_days = habit_checkins.count

    return 0 if total_days.zero?

    ((done_days.to_f / total_days) * 100).round(1)
  end
end


