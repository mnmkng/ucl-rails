require 'date'
require_relative 'DaySchedule'

# Class that handles creation of DaySchedules.
# A DaySchedule is only responsible for storing a single day.
# ScheduleBuilder initializes individual DaySchedules and returns a full schedule.
class ScheduleBuilder

  # ScheduleBuilder may be initialized with no params or a ResultList.
  # No-param init is used when an empty DaySchedule will be requested.
  #
  # @param list[ResultList] fetched using Fetcher
  def initialize(list = nil)
    @list = list
    @schedules = {}
  end

  # Separated from Person to make sure ScheduleBuilder is the only class handling DaySchedules.
  # Candidate for merging into the #build method.
  #
  # @param date [Date]
  # @return [DaySchedule] empty schedule
  def add_empty(date)
    DaySchedule.new(date)
  end

  # Builds a DaySchedule Hash using the ResultList provided at initialization.
  # keys are Dates.
  # values are DaySchedule objects.
  #
  # @return [Hash] {Date => DaySchedule}
  def build
    current = DaySchedule.new
    @list.each do |time_block|
      if current.last_day && current.last_day != Date.parse(time_block.date_start)
        arr = current.return_chain
        arr.each do |day_sch|
          @schedules[day_sch.day] = day_sch
        end
        current = DaySchedule.new
      end
      current.make_schedule(time_block.date_start,time_block.date_end, name)
    end
    arr = current.return_chain
    arr.each do |day_sch|
      @schedules[day_sch.day] = day_sch
    end
    return @schedules
  end

end