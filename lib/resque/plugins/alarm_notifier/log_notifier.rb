module Resque
  module Plugins
    module AlarmNotifier
      class LogNotifier
        def initialize(logger, level)
          @logger = logger
          @level = level
        end
        def notify(params)
          @logger.info format(params)
        end

        private
        def format(params)
          { app: "app", source: "resque", type: "queue_too_long", queues: params}
        end
      end
    end
  end
end
