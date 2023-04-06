class Schedule < ApplicationRecord
  belongs_to :shop

  validates :day, presence: true, uniqueness: {scope: :shop_id}
  validates :opening, presence: true, if: :open?
  validates :closing, presence: true, if: :open?
  validates :midday_opening, presence: true, if: :midday_closing
  validates :midday_closing, presence: true, if: :midday_opening


  #attribute :closed, :boolean, default: false
  enum day: {Sunday: 0, Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6}

  def open?
    closed == false
  end

  def self.sort_schedules(schedules)
    current_day = Date.today.strftime('%A')
    array = Date::DAYNAMES
    begin_array = []
    end_array = []
    array.each_with_index do |day, index|
      current_index = array.index(current_day)
      if array.index(day) >= current_index
        begin_array << day
      elsif
        end_array << day
      end
    end
    result = begin_array + end_array
    result.map!{|day| schedules.where(day: day)}.flatten
  end
end
