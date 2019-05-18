require 'active_support'
require 'active_support/core_ext'
require 'pry'
require 'byebug'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)

    current = @start
    i = 1

    while current <= date
      if current == date
        return true
      end
      case @period
        when 'monthly'
          current = @start.advance(months: @interval * i)
          i += 1
        when 'weekly'
          current = current.advance(weeks: @interval)
        when 'daily'
          current = current.advance(days: @interval)
      end
    end
    return false
  end
end
