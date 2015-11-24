module Resque
  module Plugins
    module AlarmNotifier
      class LogNotifier
        def initialize(logger = nil, level = :info)
          @logger = logger
          @level = level
        end
        def notify(params)
          level = level.to_sym
          return if @logger.respond_to?(level)
          @logger.send(level, format(params))
        end

        private
        def format(params)
          { app: "app", source: "resque", type: "queue_too_long", queues: params}
        end
      end
    end
  end
end
