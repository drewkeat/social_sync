class Freetime < ActiveRecord::Base
    belongs_to :user

    def duration
        (self.end - self.start)/3600
    end

    def label
        return "#{self.start.localtime.strftime("%B %d, %I:%M %p")} - #{self.end.localtime.strftime("%I:%M %p")}"
    end

    # Determines whether freetime can be aligned with self
    def match?(freetime)
        freetime.start.between?(self.start, self.end) || freetime.end.between?(self.start, self.end)
    end

    #Returns a new (unpersisted) Freetime object with matching availability if possible, else returns nil.
    def match_time(freetime)
        if (freetime.start.between?(self.start, self.end)) && (freetime.end.between?(self.start, self.end))
            return Freetime.new(start: freetime.start, end: freetime.end)
        elsif freetime.end.between?(self.start, self.end)
            return Freetime.new(start: self.start, end: freetime.end)
        elsif freetime.start.between?(self.start, self.end)
            return Freetime.new(start: freetime.start, end: self.end)
        end
        nil
    end

end

