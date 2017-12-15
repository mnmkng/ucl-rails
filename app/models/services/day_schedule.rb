module Services

  require 'time'

  # Taken from an earlier project of mine where the class
  # was used to parse uuOS API responses.



  # Class that handles parsing of individual Lessons
  # and represents the given day's appointments using a size 40 Array
  # where [0] represents 8:00 - 8:15 and [39] reps. 17:45 - 18:00.
  class DaySchedule

    attr_reader :day, :schedule

    # Initializes the DaySchedule with an empty size 40 array.
    # May be directly initialized with a date. If not, nil is used
    # and the date will be filled later using #make_schedule
    #
    # @param date [Date]
    def initialize(date = nil)
      @schedule = Array.new(40)
      @day = date
      @next_day = nil
    end

    # helper method to streamline access to schedule
    def [](i)
      @schedule[i]
    end

    # helper method to streamline access to schedule
    def []=(i, item)
      @schedule[i] = item
    end

    # Currently only runs #mark_as_busy
    # Method ready to house other actions connected to making schedule.
    #
    # @param date_start_string [String] takes string because ResultList dates are strings
    # @param date_end_string [String]
    # @return [Array] of either one or more DaySchedule
    def make_schedule(date_start, date_end, name)
      mark_as_busy(date_start, date_end, name)
    end

    # Recursively parses the appointment provided via start and end strings
    # and populates the inner array with relevant 15 minute blocks.
    # If the appointment falls into single day, only self remains.
    # If it falls over multiple days, new instances of DaySchedule
    # are chained into a singly-linked list in the next_day variable.
    #
    # @param date_start_string [String] takes string because ResultList dates are strings
    # @param date_end_string [String]
    # @return [Array] of either one or more DaySchedule
    def mark_as_busy(d_start, d_end, name)

      # gets starting and end Time objects of the interval
      # d_start = Time.parse(date_start_string).to_date
      # d_end = Time.parse(date_end_string).to_date
      # if the days are equal (one day appointment)
      if d_start.to_date == d_end.to_date
        start = to_index(d_start)
        finish = to_index(d_end) - 1

        start.upto([finish, 39].min) do |i| #makes sure the loop doesnt overflow for times > 18:00
          @schedule[i] = name
        end
      else # multiple day appointment
        start = to_index(d_start)
        start.upto(39) do |i|
          @schedule[i] = name
        end
        # initialize new instance in the chain
        @next_day = DaySchedule.new
        # recursively call itself, beginning on the next day
        @next_day.mark_as_busy(add_day(d_start), d_end, name)

      end
    end

    # Parses a single date string (point in time) to an index,
    # representing the point in time in the inner array.
    # [0] = 8:00 - 8:15, [1] = 8:15 - 8:20, ... [39] = 17:45 - 18:00
    # Times before 8:00 are thrown away and parsed as starting at 8:00.
    #
    # @param date_string [String]
    # @return [Fixnum] index
    def to_index(time)
      # time = Time.parse(date_time)
      day = time.to_date
      midnight = time.midnight

      @day = day if @day.nil?
      raise "Attempting to save multiple days in a single DaySchedule." unless @day == day

      index = ((time - midnight) / 60 / 15 - 32).to_i
      return index < 0 ? 0 : index
    end

    # Just adds a day to the given string.
    #
    # @param date_string [String]
    # @return [String] time in iso8601 format
    def add_day(day)
      # day = Time.parse(date_string).to_date
      next_day = day.midnight + 1.day
      return next_day
    end

    # Recursively runs through the next_day chain and returns an array
    # of all DaySchedules in the chain.
    #
    # @return [Array] of either one or more DaySchedule
    def return_chain
      if @next_day.nil?
        return [self]
      else
        return [self] + @next_day.return_chain
      end
    end

    # Returns the last DaySchedule in the next_day chain.
    #
    # @return [DaySchedule]
    def last_day
      if @next_day.nil?
        return self.day
      else
        return @next_day.last_day
      end
    end

    # Helper method to print out DaySchedule contents.
    def to_s
      "#{@day.to_s} #{@schedule.to_s}"
    end

    # DaySchedule can convert itself to a HTML table row
    # used for displaying in a HTML week schedule.
    #
    # @return [String] of HTML <td> elements (no <tr>)
    def to_html_row
      row = ''
      count = 0
      name = ''
      @schedule.each_with_index do |block, index|

        if block.nil? && count.zero?
          row << '<td></td>'
        elsif !count.zero? && block.nil?
          row << count.to_s
          row << '">'
          row << name
          row << '</td>'
          row << '<td></td>'
          count = 0
        elsif !count.zero? && index == @schedule.length - 1
          row << (count + 1).to_s
          row << '">'
          row << name
          row << '</td>'
        elsif !count.zero?
          count += 1
        else
          row << '<td class="bg-primary table-dark"" colspan="' if count.zero?
          count += 1
          name = block
        end

      end
      row.html_safe
    end

  end
end