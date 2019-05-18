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
    @date = date

    case @period
      when 'monthly'
        return increment_month
      when 'weekly'
        return increment_week
      when 'daily'
        return increment_day
    end

  end

  def increment_month
    i = 1
    current = @start
    while current <= @date
      if current == @date
        return true
      end
      current = @start.advance(months: @interval * i)
      i += 1
    end
    return false
  end

  def increment_week
    current = @start
    while current <= @date
      if current == @date
        return true
      end
      current = current.advance(weeks: @interval)
    end
    return false
  end

  def increment_day
    current = @start
    while current <= @date
      if current == @date
        return true
      end
      current = current.advance(days: @interval)
    end
    return false
  end

end
