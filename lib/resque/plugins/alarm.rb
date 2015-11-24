module Resque
  module Plugins
    module Alarm
      class << self
        attr_accessor :notifier, :threshold
        def configure
          yield self
        end
      end
      def after_enqueue_check_alarm(*args)
        # Dont know which queue to enqueue, so check'em all
        long_tailer = Resque.queues.inject({}) do|cr,q|
          size = Resque.size(q)
          if size > self.class.threshold
            cr[q.to_sym] = Resque.size(q)
          end
          cr
        end
        unless long_tailer.empty?
          notify(long_tailer)
        end
      end

      private
      def notify(params)
        self.class.notifier.notify(params)
      end
    end
  end
end
