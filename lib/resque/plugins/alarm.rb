module Resque
  module Plugins
    module Alarm
      def after_enqueue_check_alarm(*args)
        # Dont know which queue to enqueue, so check'em all
        long_tailer = Resque.queues.inject({}) do|cr,q|
          size = Resque.size(q)
          if size > threshold
            cr[q.to_sym] = Resque.size(q)
          end
          cr
        end
        unless long_tailer.empty?
          puts "Queue is too long:"
          puts long_tailer.inspect
          # Mailer.alarm(queue, size)
        end
      end

      private
      def sleep_time
        0
      end
      def threshold
        1
      end
      def last_alarm
        Time.now
      end

    end
  end
end

