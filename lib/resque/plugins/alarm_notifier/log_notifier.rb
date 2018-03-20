module Resque
  module Plugins
    module AlarmNotifier
      class LogNotifier
        def initialize(logger = nil, level = :info, app_name = "app")
          @logger = logger
          @level = level.to_sym
          @app_name = app_name
        end
        def notify(params)
          return unless @logger.respond_to?(@level)
          @logger.send(@level, format(params))
        end

        private
        def format(params)
          { app: @app_name, source: "resque-queue-length-alarm", type: "resque_queue_too_long", queues: params}.to_json
        end
      end
    end
  end
end
