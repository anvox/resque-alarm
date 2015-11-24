module Resque
  module Plugins
    module Alarm
      def after_enqueue_check_alarm(*args)
        # queue = ""
        # size = Resque.size(queue)
        # if size > threshold
        #   if Time.now - last_alarm > sleep_time
        #     Mailer.alarm(queue, size)
        #   end
        # end
        Rails.logger.info "Executing Alarm.after_enqueue_check_alarm"
        puts "PUT: Executing Alarm.after_enqueue_check_alarm"
      end

      private
      def sleep_time
        0
      end
      def threshold
        0
      end
      def last_alarm
        Time.now
      end

    end
  end
end

