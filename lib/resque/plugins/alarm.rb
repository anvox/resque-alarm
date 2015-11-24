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
          notify(long_tailer)
        end
      end

      private
      def threshold
        10
      end
      def notify(params)
        Resque::Plugins::Alarm::LogNotifier.notify(params)
      end
    end
  end
end

